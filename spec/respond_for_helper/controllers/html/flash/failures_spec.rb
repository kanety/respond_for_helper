describe RespondForHelper::Formats::Html, type: :request do
  context 'failure with original flash' do
    after do
      debug response.body
    end

    it 'create' do
      post flash_failures_path
      expect(request.flash.now[:alert]).to include('Original alert')
    end
  end
end
