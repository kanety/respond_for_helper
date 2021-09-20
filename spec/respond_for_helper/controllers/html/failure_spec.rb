describe RespondForHelper::Formats::Html, type: :request do
  context 'failure' do
    after do
      debug response.body
    end

    it 'create' do
      post failures_path
      expect(response.status).to eq(422)
      expect(response.body).to include('new')
    end

    it 'update' do
      patch failure_path(id: 1)
      expect(response.status).to eq(422)
      expect(response.body).to include('edit')
    end

    it 'destroy' do
      delete failure_path(id: 1)
      expect(response.status).to eq(422)
      expect(response.body).to include('show')
    end

    it 'default' do
      post default_failure_path(id: 1)
      expect(response.status).to eq(422)
      expect(response.body).to include('show')
    end
  end
end
