class HomeController < ApplicationController
  layout "admin"
  
  def index
    @q = User.user.ransack(params[:q])
    @pagy, @users = pagy(@q.result(distinct: true))
  end
end
