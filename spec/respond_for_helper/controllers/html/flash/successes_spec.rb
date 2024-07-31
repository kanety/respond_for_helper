describe RespondForHelper::Flashes::Base, type: :request do
  context 'success with original flash' do
    after do
      debug response.body
    end

    it 'create' do
      post flash_successes_path
      expect(request.flash[:notice]).to include('Original notice')
    end
  end
end
