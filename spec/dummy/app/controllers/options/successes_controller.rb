class Options::SuccessesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item, success: params[:success] == 'true'
  end
end
