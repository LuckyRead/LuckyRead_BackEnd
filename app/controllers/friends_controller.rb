class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:ifollow, :random, :unfllow, :follow, :followed, :follower, :create, :update, :destroy, :follow_five_users, five_users_following_me]

  def ifollow
    @user = current_user
    @user2 = User.find_by(username: params[:username].to_s.downcase)
    if @user2.nil?
      render json: {error: 'User ' + params[:username] + ' does not exist'}, status: :ok
    else
      @query = Friend.where('follower = ? and followed = ?', @user.id, @user2.id)
      if @query == []
        render json: {response: 'NotFollowed'}, status: :ok
      else
        render json: {response: 'Followed'}, status: :ok
      end
    end
  end

  def follow_five_users
    @user = current_user
    5.times do
      @numbre = Faker::Number.between(1, 30)
      while @numbre!= @user.id
      Friend.create!(
            follower: @numbre,
            followed: @user.id
        )
      end
    end
  end

  def five_users_following_me
    @user = current_user
    5.times do
      @numbre = Faker::Number.between(1, 30)
      while @numbre!= @user.id
      Friend.create!(
            follower: @user.id,
            followed: @numbre
        )
      end
    end
  end
    
  def random
    @user = current_user
    @array1 = []
    @array2 = []
    5.times do
      @rand = Faker::Number.between(1, User.all.length)
      while @rand == @user.id
        @rand = Faker::Number.between(1, User.all.length)
      end
      @array1.push(
        Friend.create!(
          follower: @user.id,
          followed: @rand
        )
      )
      @rand = Faker::Number.between(1, User.all.length)
      while @rand == @user.id
        @rand = Faker::Number.between(1, User.all.length)
      end
      @array2.push(
        Friend.create!(
          followed: @user.id,
          follower: @rand
        )
      )
    end
    render json: {new_people_who_you_follow: @array1, new_people_who_follow_you: @array2}, status: :ok
  end

  def unfollow
    @follower = current_user
    @followed = User.find_by(username: params[:username])
    @exist = Friend.where('follower = ? and followed = ?', @follower.id, @followed.id)
    if @exist == []
      render json: {error: 'Friendship not fount'}, status: :ok
    else
      render json: @exist[0].destroy, status: :ok
    end
  end

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
    @friends = Friend.where(:followed => @user.id).pluck(:followed)
    @array = []
    @friends.each do |id|
      @temp = User.find_by(id: id)
      @hash = {id: @temp.id, username: @temp.username, name: @temp.name, lastname: @temp.lastname, profile_photo: Photo.find_by(id: @temp.photos_id).base64_image}
      @array.push(@hash)
    end
    render json: {who: 'Users who follow me', users: @array}, status: :ok
  end
    
  def friends
    arrayfriends = []
    Friend.userfollowed.each do |friends_followed, count_all|
      hash3 = {:user_id => friends_followed, :count_all => count_all}
      arrayfriends.push(hash3)
    end
    render json: arrayfriends, status: :ok
  end

  def friendsDate_ID
    @date = params[:date]
    @id = params[:id]
    arrayfriends = []
    Friend.userfollowedesp(@id, @date).each do |friends_followed, count_all|
      hash3 = {:user_id => friends_followed, :count_all => count_all}
      arrayfriends.push(hash3)
    end
    render json: arrayfriends, status: :ok
  end

  def follower
    @user = current_user
    @friends = Friend.where(:follower => @user.id).pluck(:followed)
    @array = []
    @friends.each do |id|
      @temp = User.find_by(id: id)
      @query1 = Friend.where('follower = ? and followed = ?', id, @user.id)
      @hash = {id: @temp.id, username: @temp.username, name: @temp.name, lastname: @temp.lastname, i_follow_them: (@query1 != []), profile_photo: Photo.find_by(id: @temp.photos_id).base64_image}
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
