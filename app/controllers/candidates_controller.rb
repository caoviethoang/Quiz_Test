class CandidatesController < ApplicationController
  layout "admin"
  before_action :set_question, only: [:destroy]

  def index
    @c = Candidate.ransack(params[:q])
    @pagy, @candidates = pagy(@c.result(distinct: true), items: 5)
  end

  def new
    @candidate = Candidate.new
    @candidate.exams.build
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path
    else
      render "new"
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id]).destroy
    flash[:alert] = "Candidate was deleted."
    redirect_to candidates_path
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, answers_attributes: [:id])
  end
end
