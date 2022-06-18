class Options::BlocksController < BaseController
  def create
    @item = Item.new(id: params[:id])
    @item.errors.add(:base, 'some error') if params[:failure]

    respond_for @item do |format, respond|
      respond.before_success { response.headers[:before_message] = 'called before_success' }
      respond.before_failure { response.headers[:before_message] = 'called before_failure' }

      if respond.success?
        format.html { redirect_to action: :index, status: :see_other }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

      respond.after_success { response.headers[:after_message] = 'called after_success' }
      respond.after_failure { response.headers[:after_message] = 'called after_failure' }
    end
  end
end
