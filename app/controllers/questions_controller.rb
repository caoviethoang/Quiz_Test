class QuestionsController < ApplicationController
  layout 'admin'
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @questions = Question.where("title LIKE ?", "%#{params[:search]}%")
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to question_path
    else
      flash[:danger] = "Update failed"
      redirect_to 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :kind, :category_id, answers_attributes: [:id, :title, :iscorrected, :_destroy])
  end

  def set_question
    @question = Question.find_by(id: params[:id])
    if @question.blank?
      render file: 'public/404.html'
    end
  end
end
