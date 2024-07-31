class Flash::SuccessesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    flash[:notice] = "Original notice"
    respond_for @item
  end
end
