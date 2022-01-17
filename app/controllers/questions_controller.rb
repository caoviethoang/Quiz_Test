class QuestionsController < ApplicationController
  layout "admin"
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @q = Question.ransack(params[:q])
    @pagy, @questions = pagy(@q.result(distinct: true))
  end

  def new
    @question = Question.new
    @categories = Category.all
    @question.answers.build
  end

  def create
    @categories = Category.all
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render "new"
    end
  end

  def show
    @category = @question.category.title
  end

  def edit
    @categories = Category.all
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      flash[:danger] = "Update failed"
      redirect_to "edit"
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :kind, :category_id, answers_attributes: [:id, :title, :corrected, :textfield, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end