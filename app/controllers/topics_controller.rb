class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:add_many, :add_all_topic, :rm_all_topic, :rmone, :love, :add, :addone, :add_all]
  
  def add_many
    if !params.has_key?(:topics_id)
      render json: {error: "Request hasn't topics_id attribute"}, status: :bad_request
      return
    end
    @user = current_user
    @array = params[:topics_id]
    @array1 = []
    @array.each do |i|
      @query1 = SubTopicsTopic.where('topic_id = ?', i).pluck('sub_topic_id')
      @query1.each do |j|
        @query2 = SubTopicsUser.where('sub_topic_id = ? and user_id = ?', j, @user.id)
        if @query2 != []
          next
        end
        SubTopicsUser.create!(
          user_id: @user.id,
          sub_topic_id: j,
          score: 10
        )
      end
      @array1.push(Topic.find(i).topic_name)
    end
    render json: {topics_added: @array1}
  end

  def add_all_topic
    @user = current_user
    @query1 = SubTopicsTopic.where('topic_id = ?', params[:id])
    if @query1 == []
      render json: {error: 'Not sub topics are found'}, status: :conflict
    else
      @array = []
      @query1.each do |it|
        @query2 = SubTopicsUser.where("user_id = ? and sub_topic_id = ?", @user.id, it[:sub_topic_id])
        if @query2 == []
          SubTopicsUser.create!(
            user_id: @user.id,
            sub_topic_id: it[:sub_topic_id]
          )
          @array.push({id: it[:sub_topic_id], name: SubTopic.find(it[:sub_topic_id]).sub_topic_name})
        end
      end
      if @array == []
        render json: {error: 'User alredy has all sub topics of this topic'}, status: :conflict
      else 
        render json: {sub_topics_added: @array}, status: :created
      end
    end
  end
  
  def rm_all_topic
    @user = current_user
    @query1 = SubTopicsTopic.where('topic_id = ?', params[:id])
    if @query1 == []
      render json: {error: 'Not sub topics are found'}, status: :conflict
    else
      @array = []
      @query1.each do |it|
        @sb = SubTopicsUser.find_by(sub_topic_id: it[:sub_topic_id])
        if !@sb.nil?
          @array.push({id: @sb.sub_topic_id, name: SubTopic.find(@sb.sub_topic_id).sub_topic_name})
          @sb.destroy
        end
      end
      if @array == []
        render json: {error: "User hasn't any preference with this topic"}, status: :conflict
      else
        render json: {sub_topics_deleted: @array}, status: :created
      end
    end
  end

  def love
    @love = SubTopicsUser.where('user_id = ? and sub_topic_id = ?', current_user.id, params[:id])
    if @love != []
      render json: {hurra: 'User loves this sub topic', id: params[:id], love: @love}, status: :ok
    else
      render json: {ups: 'User does not love this sub topic yet', id: params[:id], love: @love}, status: :ok
    end
  end
  
  def addone
    SubTopicsUser.create!(
      user_id: current_user.id,
      sub_topic_id: params[:id],
      score: 10
    )
    render json: {username: current_user.username, sub_topic_id: params[:id]}, status: :created
  end

  def rmone
    @noLove = SubTopicsUser.where('user_id = ? and sub_topic_id = ?', current_user.id, params[:id])
    if SubTopicsUser.find(@noLove[0].id).destroy
      render json: {preference: 'deleted'}, status: :ok
    else
      render json: {error: 'Something was wrong'}
    end
  end

  def add_all
    @sub = SubTopic.all.pluck(:id)
    @sub.each do |sub_topic_id|
      SubTopicsUser.create!(
      user_id: current_user.id,
      sub_topic_id: sub_topic_id,
      score: 10
    )
    end
    render json: {username: current_user.username, sub_topics: 'All'}, status: :created
  end

  def sub_topic
    @sub_topic = @sub_topics_topics = SubTopicsTopic.where(topic_id: params[:topic_id]).pluck(:sub_topic_id)
    array = []
    @sub_topic.each do |sub_topic_id|
      @st = SubTopic.find(sub_topic_id)
      h1 = {id: @st.id, sub_topic_name: @st.sub_topic_name}
      array.push(h1)  
    end
    render json: array, status: :ok
  end

  def add
    @sub_topics_topics = SubTopicsTopic.where(topic_id: params[:topic_id]).pluck(:topic_id, :sub_topic_id)
    @sub_topics_topics.each do |topic_id, sub_topic_id|
      SubTopicsUser.create!( user_id: current_user.id, sub_topic_id: sub_topic_id, score: 10)
    end
    render json: {username: current_user.username, topic_id: params[:topic_id]}, status: :created
  end

  def all_topic 
    @alltopics = Topic.all.paginate(page: params[:page], per_page: 10)
    @array = []
    @alltopics.each do |f|
      @hash = {
        :id => f.id,
        :topic_name => f.topic_name,
        :score => f.score,
        :topic_image => Photo.find(f.photos_id).base64_image
      }
      @array.push(@hash)
    end
    render json: @array
  end

  # GET /topics
  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 10)

    render json: @topics
  end

  # GET /topics/1
  def show
    render json: @topic
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.fetch(:topic, {})
    end
end
