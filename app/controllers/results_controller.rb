class ResultsController < ApplicationController
  layout 'admin'

  def index
    @results = Result.all
  end

  def new 
  end

  def create
  end

  def show
    @exam = Exam.where(id: @result.exam_id).pluck(:id)
    @questions = Question.where(id: @result.question_id).pluck(:title)
    @answers = Answer.where(id: @answers.question_id).pluck(:title)
    @q = Question.ransack(params[:q])
    @pagy, @questions = pagy(@q.result(distinct: true), items: 5)
  end

  private

  def result_params
    params.require(:result).permit(:exam_id, :question_id, :answer_id)
  end
end