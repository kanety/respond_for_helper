class SpecificBehavioursController < BaseController
  self.respond_for_behaviours = {
    location: { _default: :edit }
  }

  def create
    @item = Item.new(id: params[:id])
    respond_for @item
  end
end
