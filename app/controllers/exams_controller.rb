class ExamsController < ApplicationController
  layout "application"
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @e = Exam.ransack(params[:q])
    @pagy, @exams = pagy(@e.result(distinct: true), items: 5)
  end

  def new
    @exam = Exam.new
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
    if @exam.update(exam_params)
      flash[:noti] = "Submit successful"
      redirect_to thanks_path
    else
      flash[:danger] = "Submit failed"
      redirect_to "edit"
    end
  end
  
  def edit
    if @exam.results.empty?
      @questions = Question.all.sample(20)
      @questions.each do |question|
        @exam.results.build(question: question)
      end
      
      @exam.started_at = Time.zone.now
      @exam.save
    end
    @remaining_time = @exam.remaining_time
  end

  def show
  end

  def destroy
    @exam.destroy
    flash[:alert] = "Exam was deleted."
    redirect_to exams_path
  end

  def thanks
  end

  def generate
    set_exam
  end
  
  private

  def exam_params
    params.require(:exam).permit(results_attributes: [:id, :question_id, :answer_id, :text_answer])
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end

end