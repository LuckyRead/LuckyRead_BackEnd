class LikeCommentsController < ApplicationController
  before_action :set_like_comment, only: [:show, :update, :destroy]

  # GET /like_comments
  def index
    @like_comments = LikeComment.all

    render json: @like_comments
  end

  # GET /like_comments/1
  def show
    render json: @like_comment
  end

  # POST /like_comments
  def create
    @like_comment = LikeComment.new(like_comment_params)

    if @like_comment.save
      render json: @like_comment, status: :created, location: @like_comment
    else
      render json: @like_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /like_comments/1
  def update
    if @like_comment.update(like_comment_params)
      render json: @like_comment
    else
      render json: @like_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /like_comments/1
  def destroy
    @like_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_comment
      @like_comment = LikeComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_comment_params
      params.fetch(:like_comment, {})
    end
end
