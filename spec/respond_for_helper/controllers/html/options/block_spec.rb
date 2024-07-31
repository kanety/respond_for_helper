describe RespondForHelper::Formats::Html, type: :request do
  let(:controller) { Options::BlocksController }

  context 'block' do
    it 'create success' do
      post options_blocks_path(id: 1)
      expect(response.status).to eq(303)
      expect(response.headers[:before_message]).to include('called before_success')
      expect(response.headers[:after_message]).to include('called after_success')
    end

    it 'create failure' do
      post options_blocks_path(id: 1, failure: true)
      expect(response.status).to eq(422)
      expect(response.headers[:before_message]).to include('called before_failure')
      expect(response.headers[:after_message]).to include('called after_failure')
    end
  end
end
