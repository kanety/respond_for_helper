describe RespondForHelper::Formats::Html, type: :request do
  context 'specific formats' do
    after do
      debug response.body
    end

    it 'enables html get' do
      get specific_formats_path(format: :html)
      expect(response.status).to eq(200)
      expect(response.body).to include('index.html')
    end

    it 'enables html post' do
      post successes_path
      expect(response.status).to eq(303)
      expect(response).to redirect_to(action: :index)
    end

    it 'disables json' do
      get specific_formats_path(format: :json)
      expect(response.status).to eq(406)
    end
  end
end
