class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:current, :update, :destroy, :preferences_sub_topic, :preferences_topic]

  # GET /users
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
    render json: @users
  end

  # GET /users/1
  def show
    #render json: @user
    respond_to do |format|   
      format.html   
      format.pdf do
        pdf = UserPdf.new(@user)
        send_data pdf.render, filename: "export.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def best
    array = []
    User.bestuser.each do |tUser|
      tUser.each do |usern, talk|
        if User.find_by(username: usern).nil?
          break
        end
        hash1 = {:id => User.find_by(username: usern).id, :username => usern, :talk_to_us => User.find_by(username: usern).talk_to_us} 
        array.push(hash1) 
      end
    end
    render json: array, status: :ok
  end

  def email_exist
    @user = User.find_by(email: params[:email])
    if @user.nil?
      render json: {msj: "Email not taken"}, status: :ok
    else
      render json: {msj: "Email taken"}, status: :conflict
    end
  end

  def delete_temp
    @to_delete = User.where('id > 180')
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
    @user = User.find_by(username: params[:username])
    if @user.nil?
      render json: {msj: "User not taken"}, status: :ok
    else
      render json: {msj: "User taken"}, status: :conflict
    end
  end

  def signup
    user = User.new(user_params)
    user.username = params[:user][:username].to_s.downcase
    user.email = params[:user][:email].to_s.downcase
    if User.find_by(email: user.email).nil?
      if user.save
        render json: user, status: :created, msg: 'User created'
      else
        render json: {status: :unprocessable_entity, error: user.errors}, status: :unprocessable_entity
      end
    else
      render json: {msj: "Email taken"}, status: :conflict
    end
    
  end

  def current
    render json: {current_user: current_user.username}, status: 200
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
