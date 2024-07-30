class Options::Template::FailuresController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, failure_template: -> { :show }
  end

  def update
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, failure_template: :show
  end
end
