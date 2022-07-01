class Options::FailureLocationsController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, failure_location: -> { url_for(action: :show, id: @item.id) }
  end

  def update
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, failure_location: url_for(action: :show, id: @item.id)
  end

  def destroy
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, failure_location: :index
  end
end
