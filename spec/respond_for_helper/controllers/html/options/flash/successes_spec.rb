describe RespondForHelper::Formats::Html, type: :request do
  context 'success flash' do
    after do
      debug response.body
    end

    it 'create' do
      post options_flash_successes_path
      expect(request.flash[:notice]).to include('Custom notice')
    end

    it 'update' do
      patch options_flash_success_path(id: 1)
      expect(request.flash[:notice]).to include('Custom notice')
    end

    it 'destroy' do
      delete options_flash_success_path(id: 1)
      expect(request.flash[:notice]).to include('Custom notice')
    end
  end
end
