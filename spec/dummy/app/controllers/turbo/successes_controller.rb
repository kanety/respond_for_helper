class Turbo::SuccessesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item, turbo_stream: true
  end

  def update
    @item = Item.new(id: params[:id])
    respond_for @item, turbo_stream: true
  end

  def destroy
    @item = Item.new(id: params[:id])
    respond_for @item, turbo_stream: true
  end
end
