class Options::Location::SuccessesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item, location: -> { url_for(action: :show, id: @item.id) }
  end

  def update
    @item = Item.new(id: params[:id])
    respond_for @item, location: url_for(action: :show, id: @item.id)
  end

  def destroy
    @item = Item.new(id: params[:id])
    respond_for @item, location: :index
  end
end
