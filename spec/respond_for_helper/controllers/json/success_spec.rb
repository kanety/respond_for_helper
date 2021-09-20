describe RespondForHelper::Formats::Json, type: :request do
  context 'success' do
    after do
      debug response.body
    end

    it 'index' do
      get successes_path(format: :json)
      expect(response.status).to eq(200)
    end

    it 'show' do
      get success_path(id: 1, format: :json)
      expect(response.status).to eq(200)
    end

    it 'create' do
      post successes_path(id: 1, format: :json)
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)).to include({ 'id' => 1 })
    end

    it 'update' do
      patch success_path(id: 1, format: :json)
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to include({ 'id' => 1 })
    end

    it 'destroy' do
      delete success_path(id: 1, format: :json)
      expect(response.status).to eq(204)
      expect(response.body).to eq('')
    end

    it 'default' do
      post default_success_path(id: 1, format: :json)
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to include({ 'id' => 1 })
    end
  end
end
