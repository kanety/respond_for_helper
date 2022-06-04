describe RespondForHelper::Formats::Html, type: :request do
  context 'success template' do
    after do
      debug response.body
    end

    it 'create' do
      post success_templates_path(id: 1)
      expect(response.status).to eq(200)
      expect(response.body).to include('show.html')
    end

    it 'update' do
      patch success_template_path(id: 1)
      expect(response.status).to eq(200)
      expect(response.body).to include('show.html')
    end
  end
end
