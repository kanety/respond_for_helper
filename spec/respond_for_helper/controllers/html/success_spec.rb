describe RespondForHelper::Formats::Html, type: :request do
  context 'success' do
    after do
      debug response.body
    end

    it 'index' do
      get successes_path
      expect(response.status).to eq(200)
    end

    it 'show' do
      get success_path(id: 1)
      expect(response.status).to eq(200)
    end

    it 'create' do
      post successes_path
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :index)
    end

    it 'update' do
      patch success_path(id: 1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :index)
    end

    it 'destroy' do
      delete success_path(id: 1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :index)
    end

    it 'default' do
      post default_success_path(id: 1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :index)
    end
  end
end
