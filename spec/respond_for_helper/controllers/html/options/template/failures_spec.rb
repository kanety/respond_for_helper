describe RespondForHelper::Formats::Html, type: :request do
  context 'failure template' do
    after do
      debug response.body
    end

    it 'create' do
      post options_template_failures_path(id: 1)
      expect(response.status).to eq(422)
      expect(response.body).to include('show.html')
    end

    it 'update' do
      patch options_template_failure_path(id: 1)
      expect(response.status).to eq(422)
      expect(response.body).to include('show.html')
    end
  end
end
