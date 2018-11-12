class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:follow, :followed, :follower, :create, :update, :destroy]

  def follow
    @follower = current_user
    @followed = User.find_by(username: params[:username])
    @exist = Friend.where('follower = ? and followed = ?', @follower.id, @followed.id)
    if @exist == []
      @new_Friend = Friend.create!(
        follower: @follower.id,
        followed: @followed.id
      )
      render json: @new_Friend, status: :ok
    else
      render json: {error: 'Friendship alredy exist', proof: @exist}
    end
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  def followed
    @user = current_user
    @friends = Friend.where(:followed => @user.id)
    if @friends.nil?
      render json: {error: 'No content'}, status: :no_content
    else
      @myFriend = User.where(:id => @friends)
      render json: {who: 'Users who follow me', users: @myFriend}, status: :ok
    end
  end
    
  def follower
    @user = current_user
    @friends = Friend.where(:follower => @user.id).pluck(:followed)
    @array = []
    @friends.each do |id|
      @temp = User.find_by(id: id)
      @hash = {id: @temp.id, username: @temp.username, name: @temp.name, lastname: @temp.lastname, profile_photo: Photo.find_by(id: @temp.photos_id).base64_image}
      @array.push(@hash)
    end
    render json: {who: 'Users who I follow', users: @array}, status: :ok
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
