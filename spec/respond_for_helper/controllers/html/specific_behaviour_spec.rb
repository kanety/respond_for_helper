describe RespondForHelper::Formats::Html, type: :request do
  after do
    debug response.body
  end

  it 'create' do
    post specific_behaviours_path(id: 1)
    expect(response.status).to eq(303)
    expect(response).to redirect_to(action: :edit, id: 1)
  end
end
