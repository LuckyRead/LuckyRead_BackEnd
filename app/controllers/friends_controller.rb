class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:followed, :follower, :create, :update, :destroy]

  # GET /friends/1
  def show
    render json: @friend
  end

  def followed
    @user = current_user
    @friends = Friend.where(:follower => @user.id)
    if @friends.nil?
      render json: {error: 'No content'}, status: :no_content
    else
      @myFriend = User.where(:id => @friends)
      render json: {who: 'Users who follow me', users: @myFriend}, status: :ok
    end
  end
    
  def follower
    @user = current_user
    @friends = Friend.where(:followed => @user.id)
    if @friends.nil?
      render json: {error: 'No content'}, status: :no_content
    else
      @myFriend = User.where(:id => @friends)
      render json: {who: 'Users who I follow', users: @myFriend}, status: :ok
    end
  end

  # POST /friends
  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      render json: @friend, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.fetch(:friend, {})
    end
end
