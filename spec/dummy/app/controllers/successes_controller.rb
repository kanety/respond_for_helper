class SuccessesController < BaseController
  def index
    @items = [Item.new(id: 1), Item.new(id: 2)]
    respond_for @items
  end

  def show
    @item = Item.new(id: params[:id])
    respond_for @item
  end

  def create
    @item = Item.new(id: params[:id])
    respond_for @item
  end

  def update
    @item = Item.new(id: params[:id])
    respond_for @item
  end

  def destroy
    @item = Item.new(id: params[:id])
    respond_for @item
  end

  def default
    @item = Item.new(id: params[:id])
    respond_for @item
  end
end
