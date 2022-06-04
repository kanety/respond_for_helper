describe RespondForHelper::Formats::Any, type: :request do
  context 'failure' do
    after do
      debug response.body
    end

    it 'create' do
      post failures_path(format: :rss)
      expect(response.status).to eq(422)
      expect(response.body).to include('create.rss')
    end
  end
end
