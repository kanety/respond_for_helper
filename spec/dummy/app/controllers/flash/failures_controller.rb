class Flash::FailuresController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    flash.now[:alert] = "Original alert"
    respond_for @item
  end
end
