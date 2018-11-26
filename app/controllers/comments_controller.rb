class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:new, :get_comments]

  def new
    @user = current_user
    if !params.has_key?(:fragment_id)
      render json: {error: "Request hasn't fragment_id attribute"}, status: :bad_request
      return
    end
    if !params.has_key?(:comment)
      render json: {error: "Request hasn't comment attribute"}, status: :bad_request
      return
    end
    @c = Comment.create!(
      message: params[:comment],
      datetime: DateTime.now,
      user_id: @user.id,
      fragment_id: params[:fragment_id],
      likes: 0,
      dislikes: 0
    )
    render json: {new_comment_has_been_created: @c}, status: :created
  end

  def count
    @comments = Comment.where('fragment_id = ?', params[:id])
    render json: {count: @comments.length}
  end

  def get_comments
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
              datetime: it.created_at,
              liked_by_user?: (LikeComment.where('comments_id = ? and users_id = ?', it.id, @user.id) != []),
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
