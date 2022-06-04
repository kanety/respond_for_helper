describe RespondForHelper::Formats::Any, type: :request do
  context 'success' do
    after do
      debug response.body
    end

    it 'index' do
      get successes_path(format: :rss)
      expect(response.status).to eq(200)
      expect(response.body).to include('index.rss')
    end

    it 'show' do
      get success_path(id: 1, format: :rss)
      expect(response.status).to eq(200)
      expect(response.body).to include('show.rss')
    end

    it 'create' do
      post successes_path(format: :rss)
      expect(response.status).to eq(200)
      expect(response.body).to include('create.rss')
    end
  end
end
