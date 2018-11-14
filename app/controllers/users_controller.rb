class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:change_username, :showpdf, :change_talk, :change_password ,:info, :current, :update, :destroy, :preferences_sub_topic, :preferences_topic]

  def change_username
    @user = current_user
    @user.username = params[:username].to_s.downcase
    if @user.save
      render json: {talk_to_us: 'updated'}, status: :ok
    else
      render json: {error: @user.errors}, status: :not_modified
    end
  end

  def change_talk
    @user = current_user
    @user.talk_to_us = params[:talk_to_us]
    if @user.save
      render json: {talk_to_us: 'updated'}, status: :ok
    else
      render json: {error: @user.errors}, status: :not_modified
    end
  end

  def send_reset_password
    @user = User.find_by(email: params[:email])
    @token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    @URL = 'https://www.lucky-read.com/reset_password/' + @token
    UserMailer.change_password(@user, @URL).deliver_now
    render json: {jwt: @token}, status: :created
  end

  def change_password
    @user = current_user
    @user.password = params[:new_password]
    if @user.save
      render json: {password: 'updated'}, status: :ok
    else
      render json: {error: @user.errors}, status: :not_modified
    end
  end

  def info 
    @user = {:name => current_user.name, :lastname => current_user.lastname, :username => current_user.username, :email => current_user.email, :city => City.find(current_user.city_id).city_name, :talk_to_us => User.find(current_user.id).talk_to_us, :profile_photo_id => current_user.photos_id}
    render json: @user, status: :ok
  end

  def login_fb
    if params[:accessToken].nil?
      render json: {error: 'AccesToken empty'}, status: :no_content
    else
      @API_URL = 'https://graph.facebook.com/me?access_token='+params[:accessToken]
      response = HTTParty.get(@API_URL)
      # render json: response["name"], status: :ok
      if response["name"].nil? || response["id"].nil?
        render json: {error: "Facebook authentication error"}, status: :bad_request
      else
        @user = User.find_by(email: params[:email])
        if @user.nil?
          @photo = Photo.new(
            image: 'facebook_image',
            base64_image: Base64.encode64(open(params[:picture][:data][:url]).read)
          )
          @photo.save
          @username = Faker::Name.unique.first_name
          while !User.find_by(username: @username).nil?
            @username = Faker::Name.unique.first_name
          end
          @user = User.create!(
            username: @username,
            name: params[:name],
            lastname: ' ',
            email: params[:email],
            password: params[:id],
            city_id: 1,
            score: 1,
            talk_to_us: nil,
            photos_id: @photo.id
          )
          UserMailer.welcome_email(@user).deliver_now
          render json: {warning: "User not registered", jwt: Knock::AuthToken.new(payload: { sub: @user.id }).token, user: @user, username: @user.username}, status: :created
        else
          render json: { jwt: Knock::AuthToken.new(payload: { sub: @user.id }).token, username: @user.username}, status: :created
        end
      end
    end
  end

  def login_ggle
    @API_URL = 'https://www.googleapis.com/oauth2/v3/tokeninfo?id_token='+params[:tokenId]
    response = HTTParty.get(@API_URL)
    if response["email"].nil?
      render json: {error: "Google authentication error"}, status: :bad_request
    else
      @user = User.find_by(email: response["email"])
      if @user.nil?
        @photo = Photo.new(
          image: 'google_image',
          base64_image: Base64.encode64(open(params[:profileObj][:imageUrl]).read)
        )
        @photo.save
        @username = Faker::Name.unique.first_name
        while !User.find_by(username: @username).nil?
          @username = Faker::Name.unique.first_name
        end
        @user = User.create!(
          username: @username,
          name: params[:profileObj][:givenName],
          lastname: params[:profileObj][:familyName],
          email: params[:profileObj][:email],
          password: params[:googleId],
          city_id: 1,
          score: 1,
          talk_to_us: nil,
          photos_id: @photo.id
        )
        UserMailer.welcome_email(@user).deliver_now
        render json: {warning: "User not registered", jwt: Knock::AuthToken.new(payload: { sub: @user.id }).token, user: @user, username: @user.username}, status: :created
      else
        render json: { jwt: Knock::AuthToken.new(payload: { sub: @user.id }).token, username: @user.username}, status: :created
      end
    end
  end

  # GET /users
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def showpdf
    @user = current_user
    respond_to do |format|   
      format.html   
      format.pdf do
        pdf = UserPdf.new(@user)
        send_data pdf.render, filename: "export.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end 

  def best
    @array = []
    User.bestuser(5).each do |tUser|
      tUser.each do |usern, talk, name, photo|
        @user = User.find_by(username: usern)
        if @user.nil?
          break
        end
        @hash = {username: @user.username, name: @user.name, lastname: @user.lastname, profie_photo: Photo.find_by(id: @user.photos_id).base64_image}
        @array.push(@hash)
      end
    end
    render json: @array, status: :ok
  end

  def email_exist
    @user = User.find_by(email: params[:email].to_s.downcase)
    if @user.nil?
      render json: {email: "Not Taken"}, status: :ok
    else
      render json: {email: "Taken"}, status: :ok
    end
  end

  def delete_temp
    @to_delete = User.where('id > 30')
    render json: @to_delete
    @to_delete.destroy_all
  end

  def preferences_sub_topic
    @user1 = User.find_by(username: params[:username])
    @sub_topics = User.preferencessub_topic_name(@user1.id)
    array = []
    @sub_topics.each do |user, sub_topic_name|
      hash1 = {:sub_topic_id => SubTopic.find_by(sub_topic_name: sub_topic_name).id, :sub_topic_name => sub_topic_name}
      array.push(hash1)
    end
    render json: array, status: :ok
  end

  
  def new_users
    arrayUsers = []
    User.userold.each do |id, username|
      hash2 = {:user_id => User.find_by(id: id).id, :username => username}
      arrayUsers.push(hash2)
    end 
    render json: arrayUsers, status: :ok
  end

  def user_activity
    arrayUsersAct = []
    Reaction.useractive.each do |reactions_users_id, count_all|
      hash3 = {:user_id => reactions_users_id, :count_all => count_all}
      arrayUsersAct.push(hash3)
    end
    render json: arrayUsersAct, status: :ok
  end 

  def user_activityDate
    @date = params[:date]
    arrayUsersAct = []
    Reaction.useractivedate(@date).each do |reactions_users_id, count_all|
      hash3 = {:user_id => reactions_users_id, :count_all => count_all}
      arrayUsersAct.push(hash3)
    end
    render json: arrayUsersAct, status: :ok
  end

  def user_activityDate_Id
    @date = params[:date]
    @id = params[:id]
    arrayUsersAct = []
    Reaction.useractivedateanduser(@id, @date).each do |reactions_users_id, count_all|
      hash3 = {:user_id => reactions_users_id, :count_all => count_all}
      arrayUsersAct.push(hash3)
    end
    render json: arrayUsersAct, status: :ok
  end

  def preferences_topic
    @user1 = User.find_by(username: params[:username])
    @topics = User.preferencestopic_name(@user1.id)
    array = []
    @topics.each do |user, topic_name|
      hash1 = {:topic_id => Topic.find_by(topic_name: topic_name).id, :topic_name => topic_name}
      array.push(hash1)
    end
    render json: array, status: :ok
  end

  def user_exist
    @user = User.find_by(username: params[:username].to_s.downcase)
    if @user.nil?
      render json: {user: "Not Taken"}, status: :ok
    else
      render json: {user: "Taken"}, status: :ok
    end
  end

  def signup
    @user = User.new(user_params)
    @user.username = params[:user][:username].to_s.downcase
    @user.email = params[:user][:email].to_s.downcase
    if !User.find_by(username: @user.username).nil?
      render json: {msj: "Username taken"}, status: :conflict
    elsif !User.find_by(email: @user.email).nil?
      render json: {msj: "Email taken"}, status: :conflict
    else
      if @user.save
        render json: @user, status: :created
        UserMailer.welcome_email(@user).deliver_now
      else
        render json: {status: :unprocessable_entity, error: @user.errors}, status: :unprocessable_entity
      end
    end
  end

  def current
    render json: {current_user: current_user.username}, status: :ok
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id]) #:id
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:user].permit(:username, :password, :name, :lastname, :email, :password, :city_id)
    end
end
