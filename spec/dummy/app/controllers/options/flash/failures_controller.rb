class Options::Flash::FailuresController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, alert: -> { "Custom alert" }
  end

  def update
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, alert: :custom_alert
  end

  def destroy
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, alert: "Custom alert"
  end
end
