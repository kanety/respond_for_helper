describe RespondForHelper::Formats::Json, type: :request do
  context 'failure' do
    after do
      debug response.body
    end

    it 'create' do
      post failures_path(id: 1, format: :json)
      expect(response.status).to eq(422)
      expect(response.body).to include('error')
    end

    it 'update' do
      patch failure_path(id: 1, format: :json)
      expect(response.status).to eq(422)
      expect(response.body).to include('error')
    end

    it 'destroy' do
      delete failure_path(id: 1, format: :json)
      expect(response.status).to eq(422)
      expect(response.body).to include('')
    end

    it 'default' do
      post default_failure_path(id: 1, format: :json)
      expect(response.status).to eq(422)
      expect(response.body).to include('error')
    end
  end
end
