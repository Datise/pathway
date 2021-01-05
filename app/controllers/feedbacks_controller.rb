class FeedbacksController < ApplicationController
  include Secured
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = User.first.feedbacks_given
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    # To Do, same preventions as create
    @friend = User.find(params[:friend_id].to_i)
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    params = feedback_params
    # To Do change to current user
    # To Do ensure they are friends and ensure person is open to feedback
    params[:from] = User.first
    params[:to] = User.find(params[:to].to_i)
    @feedback = Feedback.new(params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to dashboard_url, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to dashboard_show_url, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:observation, :feeling, :need, :request, :friend_id, :to)
    end
end
