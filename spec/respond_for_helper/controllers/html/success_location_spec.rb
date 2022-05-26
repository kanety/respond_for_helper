describe RespondForHelper::Formats::Html, type: :request do
  context 'success location' do
    after do
      debug response.body
    end

    it 'create' do
      post success_locations_path(id: 1)
      expect(response.status).to eq(303)
      expect(response).to redirect_to(action: :show, id: 1)
    end

    it 'update' do
      patch success_location_path(id: 1)
      expect(response.status).to eq(303)
      expect(response).to redirect_to(action: :show, id: 1)
    end

    it 'destroy' do
      delete success_location_path(id: 1)
      expect(response.status).to eq(303)
      expect(response).to redirect_to(action: :index)
    end
  end
end
