class AnswersController < ApplicationController
  layout 'admin'
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @answers = Answer.where("title LIKE ?", "%#{params[:search]}%")
    else
      @answers = Answer.all
    end
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to answers_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update(answerparams)
      redirect_to answer_path
    else
      flash[:danger] = "Update failed"
      redirect_to 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answers_path
  end

  private

  def answer_params
    params.require(:answer).permit :title
  end

  def set_answer
    @answer = Answer.find_by(id: params[:id])
    if @answer.blank?
      render file: 'public/404.html'
    end
  end
end