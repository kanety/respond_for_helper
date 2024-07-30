class Options::Template::SuccessesController < BaseController
  def create
    @item = Item.new(id: params[:id])
    respond_for @item, template: -> { :show }
  end

  def update
    @item = Item.new(id: params[:id])
    respond_for @item, template: :show
  end
end
