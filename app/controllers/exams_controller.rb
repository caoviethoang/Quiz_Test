class ExamsController < ApplicationController
  layout 'application'
  before_action :set_exam, only: [:show,:destroy]

  def index
    @e = Exam.ransack(params[:q])
    @pagy, @exams = pagy(@e.result(distinct: true), items: 5)
  end

  def create    
    if generate_exam_detail
      redirect_to exams_path
    else
      render 'new'
    end
  end

  def new
    @exam = Exam.new
  end

  def update
  end

  def show
    @exam = Exam.find(params[:id])
    question_ids = @exam.results.pluck :question_id
    @questions = Question.where(id: question_ids).paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to exams_path
  end

  private

  def generate_exam_detail
    ActiveRecord::Base.transaction do
      @exam = Exam.create(exam_params)
      if @exam
        @questions = Question.find(Question.pluck(:id).sample(10))
        @questions.each { |q|
          Result.new(exam_id: @exam.id, question_id: q.id).save!
        }
      end
    end
    true
  end

  def exam_params
    params.require(:exam).permit(:name, results_attributes: [:id, :question_id, :answer_id])
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end
end