describe RespondForHelper::Formats::Html, type: :request do
  context 'success location' do
    after do
      debug response.body
    end

    it 'create' do
      post options_status_successes_path(id: 1)
      expect(response.status).to eq(301)
    end
  end
end
