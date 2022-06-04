describe RespondForHelper::Formats::TurboStream, type: :request do
  context 'failure' do
    after do
      debug response.body
    end

    it 'create' do
      post turbo_failures_path(format: :turbo_stream)
      expect(response.status).to eq(422)
      expect(response.body).to include('create.turbo_stream')
    end

    it 'update' do
      patch turbo_failure_path(id: 1, format: :turbo_stream)
      expect(response.status).to eq(422)
      expect(response.body).to include('update.turbo_stream')
    end

    it 'destroy' do
      delete turbo_failure_path(id: 1, format: :turbo_stream)
      expect(response.status).to eq(422)
      expect(response.body).to include('destroy.turbo_stream')
    end
  end
end
