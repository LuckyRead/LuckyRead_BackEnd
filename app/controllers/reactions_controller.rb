class ReactionsController < ApplicationController
  before_action :set_reaction, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:reactions_to_freagments]
  # GET /reactions
  def index
    @reactions = Reaction.all.paginate(page: params[:page], per_page: 10)

    render json: @reactions
  end

  # GET /reactions/1
  def show
    render json: @reaction
  end

  # POST /reactions
  def create
    @reaction = Reaction.new(reaction_params)

    if @reaction.save
      render json: @reaction, status: :created, location: @reaction
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  def reactions_to_freagments
    @user = current_user
    @reactions = Reaction.find_by(users_id: @user.id)
    render json: {Reactios_of_current_users_to_all_fragments: @reactions}, status: :ok
  end

  def numbers_of_likes
    @user = current_user
    @comments = Comment.find_by(user_id: @user.id)
    @likes
    @comments.each do |id|
      @likes = @likes + LikeComment.find_by(comments_id: id).group(:comments_id).count()
    end
  end
  # PATCH/PUT /reactions/1
  def update
    if @reaction.update(reaction_params)
      render json: @reaction
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reactions/1
  def destroy
    @reaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reaction_params
      params.fetch(:reaction, {})
    end
end
