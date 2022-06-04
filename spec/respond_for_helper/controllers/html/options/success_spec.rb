describe RespondForHelper::Formats::Html, type: :request do
  context 'success option' do
    after do
      debug response.body
    end

    it 'create success' do
      post options_successes_path(success: true)
      expect(response.status).to eq(303)
      expect(response).to redirect_to(action: :index)
    end

    it 'create failure' do
      post options_successes_path(success: false)
      expect(response.status).to eq(422)
      expect(response.body).to include('new.html')
    end
  end
end
