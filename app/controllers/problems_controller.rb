class ProblemsController < OpenReadController
  before_action :set_problem, only: [:show, :update, :destroy]

  # GET /problems
  def index
    @problems = Problem.all

    render json: @problems
  end

  # GET /problems/1
  def show
    render json: @problem
  end

  # POST /problems
  def create
    @problem = current_user.problems.build(problem_params)

    if @problem.save
      render json: @problem, status: :created, location: @problem
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problems/1
  def update
    if @problem.update(problem_params)
      render json: @problem
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problems/1
  def destroy
    @problem.destroy
  end

  # PATCH /like
  # def upvote
  #   @problem = Problem.find(params[:id])
  #   @problem.upvote_from current_user
  # end

  def upvote
    # current_user = User.find_by_id(session[:user_id])
    @problem = Problem.find(params[:id])
    current_user.upvotes @problem
    # redirect_to :back
  end

  # PATCH /unlike
  # def downvote
  #   @problem = Problem.find(params[:id])
  #   @problem.downvote_from current_user
  # end

  def downvote
    @problem = Problem.find(params[:id])
    @problem.downvote_by current_user
    # redirect_to :back
  end

  def like
    @problem = Problem.find(params[:id])

    render json: @problem.votes_for.where(current_user.id == :voter_id)
                         .pluck(:vote_flag)
  end

  # def like
  #   @problem = Problem.find(params[:id])
  #   if Problem.where(current_user.votes.voter_id == '2')
  #     current_user.downvotes @problem
  #   elsif Problem.where(current_user.votes.voter_id == '1')
  #     current_user.upvotes @problem
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def problem_params
      params.require(:problem).permit(:name, :content, :hint, :solution, :rating, :answer, :category, :user_id)
    end
end
