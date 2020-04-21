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

  def upvote
    @problem = Problem.find(params[:id])
    current_user.upvotes @problem
    # redirect_to :back
  end

  def downvote
    @problem = Problem.find(params[:id])
    @problem.downvote_by current_user
    # redirect_to :back
  end

  def like
    @problem = Problem.find(params[:id])
    if current_user

    render html: @problem.votes_for.where(voter_id: [current_user.id])
                         .pluck(:vote_flag)
    end
  end

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
