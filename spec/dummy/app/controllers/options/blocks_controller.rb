class Options::BlocksController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item do
      response.body = 'called block'
    end
  end
end
