class HomeController < ApplicationController
  layout "admin"
  def index
    @q = Candidate.ransack(params[:q])
    @pagy, @candidates = pagy(@q.result(distinct: true))
  end
end
