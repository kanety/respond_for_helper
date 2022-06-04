class SpecificBehavioursController < BaseController
  self.respond_for_config = {
    behaviours: {
      html: {
        _default: { success: { redirect: :edit } }
      }
    }
  }

  def create
    @item = Item.new(id: params[:id])
    respond_for @item
  end
end
