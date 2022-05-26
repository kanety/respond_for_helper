describe RespondForHelper::Formats::Html, type: :request do
  let(:controller) { Options::BlocksController }

  it 'create' do
    post options_blocks_path(id: 1)
    expect(response.status).to eq(303)
    expect(response.body).to include('called block')
  end
end
