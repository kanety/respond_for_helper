describe RespondForHelper::Formats::Html, type: :request do
  context 'failure location' do
    after do
      debug response.body
    end

    it 'create' do
      post failure_locations_path(id: 1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :show, id: 1)
    end

    it 'update' do
      patch failure_location_path(id: 1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :show, id: 1)
    end

    it 'destroy' do
      delete failure_location_path(id: 1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(action: :index)
    end
  end
end
