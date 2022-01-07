class ExamsController < ApplicationController
  layout 'application'
  before_action :set_exam, only: [:show,:destroy]

  def index
    @e = Exam.ransack(params[:q])
    @pagy, @exams = pagy(@e.result(distinct: true), items: 5)
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to thanks_path
    else
      @questions = Question.find(Question.pluck(:id).sample(10))
      render :new
    end
  end

  def new
    @exam = Exam.new
    @questions = Question.find(Question.pluck(:id).sample(10))
    @questions.each do |question|
      @exam.results.build(question: question)
    end
  end

  def update
  end

  def show
  end

  def destroy
    @exam.destroy
    redirect_to exams_path
  end

  def thanks
  end

  private

  def exam_params
    params.require(:exam).permit(:id, results_attributes: [:question_id, :answer_id, :textfield])
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end
end