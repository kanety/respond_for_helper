class Turbo::FailuresController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, turbo_stream: true, html: false
  end

  def update
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, turbo_stream: true, html: false
  end

  def destroy
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, turbo_stream: true, html: false
  end
end
