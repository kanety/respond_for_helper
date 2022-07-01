describe RespondForHelper::Formats::Html, type: :request do
  context 'failure status' do
    after do
      debug response.body
    end

    it 'create' do
      post options_failure_statuses_path(id: 1)
      expect(response.status).to eq(400)
    end
  end
end
