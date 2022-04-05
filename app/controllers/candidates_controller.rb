class CandidatesController < ApplicationController
  layout "admin"
  
  before_action :set_candidate, only: [:edit, :update, :destroy]

  def index
    @pagy, @candidates = pagy(Candidate.all)
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path
    else
      render "new"
    end
  end

  def edit
    set_candidate
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path
    else
      flash[:danger] = "Update failed"
      redirect_to "edit"
    end
  end

  def destroy
    @candidate.destroy
    flash[:alert] = "Candidate has been deleted."
    redirect_to candidates_path
  end

  private

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :exam_id, :mark, exams_attributes: [:id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
