describe RespondForHelper::Formats::Html, type: :request do
  context 'success location' do
    after do
      debug response.body
    end

    it 'create' do
      post options_success_statuses_path(id: 1)
      expect(response.status).to eq(301)
    end
  end
end
