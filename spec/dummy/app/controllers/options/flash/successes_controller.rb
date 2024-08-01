class Options::Flash::SuccessesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item, notice: -> { "Custom notice" }
  end

  def update
    @item = Item.new(id: params[:id])
    respond_for @item, notice: :custom_notice
  end

  def destroy
    @item = Item.new(id: params[:id])
    respond_for @item, notice: "Custom notice"
  end
end
