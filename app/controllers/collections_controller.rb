class CollectionsController < SessionsController
  def index
    @collections = Collection.joins(:user_groups).where(user_groups:{ user: current_user})
  end
end
