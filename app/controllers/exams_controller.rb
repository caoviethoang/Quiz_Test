class ExamsController < ApplicationController
  layout "application"

  before_action :set_exam, only: [:show, :generate, :destroy]
  before_action :in_progess_exam, only: [:edit, :update]

  def index
    @e = Exam.ransack(params[:q])
    @pagy, @exams = pagy(@e.result(distinct: true), items: 5)
  end

  def new
    @exam = Exam.new
  end

  def custom
    @exam = Exam.new(params[:exam])
    @questions = Question.all
    @questions.each do |question|
      if @exam.results.empty?
          @exam.results.build(question: question)
      end
    end
  end
  
  def create
    @exam = Exam.new
    if @exam.save
      redirect_to exams_path
    else
      render "new"
    end
  end

  def update
    @exam.ended_at = Time.zone.now
    @exam.finished!
    if @exam.update(exam_params)
      flash[:noti] = "Submit successful!"
      redirect_to thanks_path
    else
      flash[:danger] = "Submit failed!"
      redirect_to "edit"
    end
  end

  def edit
    if @exam.results.empty?
      @questions = Question.all.sample(Settings.shared.total_questions)
      @questions.each do |question|
        @exam.results.build(question: question)
      end
      @exam.started_at = Time.zone.now
      @exam.save
    end
    @remaining_time = @exam.remaining_time
  end
  
  def show
    @total_time = @exam.ended_at - @exam.started_at
  end

  def destroy
    @exam.destroy
    flash[:alert] = "Exam has been deleted."
    redirect_to exams_path
  end

  def thanks
  end

  def generate
  end

  private

  def exam_params
    params.require(:exam).permit(results_attributes: [:id, :question_id, :answer_id, :text_answer])
  end

  def set_exam
    @exam = Exam.find_by(token: params[:token])
  end

  def in_progess_exam
    @exam = Exam.in_progess.find_by!(token: params[:token])
  end
end