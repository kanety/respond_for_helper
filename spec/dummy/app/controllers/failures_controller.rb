class FailuresController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item
  end

  def update
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item
  end

  def destroy
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item
  end

  def default
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item
  end
end
