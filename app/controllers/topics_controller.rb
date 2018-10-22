class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:add]

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
