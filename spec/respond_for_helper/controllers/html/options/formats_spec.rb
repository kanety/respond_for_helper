describe RespondForHelper::Formats::Html, type: :request do
  context 'formats option' do
    after do
      debug response.body
    end

    it 'enables html' do
      get options_formats_path(format: :html)
      expect(response.status).to eq(200)
      expect(response.body).to include('index.html')
    end

    it 'disables json' do
      get options_formats_path(format: :json)
      expect(response.status).to eq(406)
    end
  end
end
