class Options::SuccessStatusesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item, status: :moved_permanently
  end
end
