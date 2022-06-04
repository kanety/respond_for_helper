describe RespondForHelper::Formats::TurboStream, type: :request do
  context 'success' do
    after do
      debug response.body
    end

    it 'create' do
      post turbo_successes_path(format: :turbo_stream)
      expect(response.status).to eq(200)
      expect(response.body).to include('create.turbo_stream')
    end

    it 'update' do
      patch turbo_success_path(id: 1, format: :turbo_stream)
      expect(response.status).to eq(200)
      expect(response.body).to include('update.turbo_stream')
    end

    it 'destroy' do
      delete turbo_success_path(id: 1, format: :turbo_stream)
      expect(response.status).to eq(200)
      expect(response.body).to include('destroy.turbo_stream')
    end
  end
end
