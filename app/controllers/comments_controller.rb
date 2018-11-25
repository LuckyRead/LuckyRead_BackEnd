class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:get_comments]

  def get_comments
    #likes
    #dislikes
    #datetime
    if Fragment.find(params[:id]).nil?
      render json: {error: 'Does not exist any fragment with this id'}, status: :ok
    else
      @comments = Comment.where('fragment_id = ?', params[:id]).order('created_at ASC')
      if @comments == []
        render json: {error: "There are no comments for this fragment"}
      else
        @array = []
        @comments.each do |it|
          @user = User.find(it.user_id)
          @array.push(
            {
              username: @user.username,
              name: @user.name,
              text: it.message,
              likes: it.likes,
              dislikes: it.dislikes,
              datetime: it.created_at,
              profile_photo: Photo.find(@user.photos_id).base64_image
            }
          )
        end
        render json: {comments: @array}, status: :ok
      end
    end
  end

  # GET /comments
  def index
    @comments = Comment.all.paginate(page: params[:page], per_page: 10)

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.fetch(:comment, {})
    end
end
