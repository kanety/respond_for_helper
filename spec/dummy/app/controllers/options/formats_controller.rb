class Options::FormatsController < BaseController
  def index
    @items = [Item.new(id: 1)]
    respond_for @items, formats: :html
  end
end
