class GoalsController < ApplicationController
  before_action :require_login!

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = current_user.goals.find(params[:id])

    if @goal
      render :edit
    else
      flash[:errors] = ["this is not the goal you are looking for"]
      redirect_to :index
    end
  end

  def update
    @goal = current_user.goals.find(params[:id])

    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def index
    @all_goals = Goal.where(private: false)
                     .where("user_id != ?", current_user.id)

    @user_goals = Goal.where("user_id = ?", current_user.id)
  end

  def show
    @goal = Goal.includes(comments: :commenter).find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :private, :completed)
  end
end
