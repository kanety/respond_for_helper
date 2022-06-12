class SpecificFormatsController < BaseController
  self.respond_for_config = {
    formats: [:html],
    formatters: { html: RespondForHelper::Formats::Html }
  }

  def index
    @items = [Item.new(id: 1)]
    respond_for @items
  end
end
