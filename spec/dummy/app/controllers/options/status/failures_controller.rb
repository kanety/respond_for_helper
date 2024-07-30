class Options::Status::FailuresController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, "error")
    respond_for @item, failure_status: :bad_request
  end
end
