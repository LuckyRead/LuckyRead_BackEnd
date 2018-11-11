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
    @myFriend = User.where(:id => @friends)
    @array = []
    @myFriend.each do |user_who|
      if Photo.find_by(id: user_who.photos_id).nil?
        @b64 = 
      @hash = {:id => user_who.id, :username => user_who.username, :lastname => user_who.lastname, :email => user_who.email, :city => City.find_by(id: user_who.city_id).city_name, :score => user_who.score, :talk_to_us => user_who.talk_to_us, :base64_image => @b64}
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
