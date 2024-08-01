describe RespondForHelper::Formats::Html, type: :request do
  context 'failure flash' do
    after do
      debug response.body
    end

    it 'create' do
      post options_flash_failures_path
      expect(request.flash.now[:alert]).to include('Custom alert')
    end

    it 'update' do
      patch options_flash_failure_path(id: 1)
      expect(request.flash.now[:alert]).to include('Custom alert')
    end

    it 'destroy' do
      delete options_flash_failure_path(id: 1)
      expect(request.flash.now[:alert]).to include('Custom alert')
    end
  end
end
