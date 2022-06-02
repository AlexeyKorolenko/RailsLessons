class AnswersController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_question!
  before_action :set_answer!, except: %i[create]

  def create
    @answer = @question.answers.build answer_params

    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question, anchor: dom_id(@answer))
    else
      @answers = Answer.where(question_id: @question).order created_at: :desc
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to questions_path(@question)
  end

  def update
    if @answer.update answer_params
      flash[:success] = 'Answer updated!'
      redirect_to questions_path(@question, anchor: "#{@answer.id}")
    else
      render :edit
    end
  end

  def edit; end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find_by(id: params[:question_id])
  end

  def set_answer!
    @answer = @question.answers.find(params[:id])
  end
end
