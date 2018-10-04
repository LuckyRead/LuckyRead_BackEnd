class RelTopicSubTopicsController < ApplicationController
  before_action :set_rel_topic_sub_topic, only: [:show, :update, :destroy]

  # GET /rel_topic_sub_topics
  def index
    @rel_topic_sub_topics = RelTopicSubTopic.all

    render json: @rel_topic_sub_topics
  end

  # GET /rel_topic_sub_topics/1
  def show
    render json: @rel_topic_sub_topic
  end

  # POST /rel_topic_sub_topics
  def create
    @rel_topic_sub_topic = RelTopicSubTopic.new(rel_topic_sub_topic_params)

    if @rel_topic_sub_topic.save
      render json: @rel_topic_sub_topic, status: :created, location: @rel_topic_sub_topic
    else
      render json: @rel_topic_sub_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rel_topic_sub_topics/1
  def update
    if @rel_topic_sub_topic.update(rel_topic_sub_topic_params)
      render json: @rel_topic_sub_topic
    else
      render json: @rel_topic_sub_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rel_topic_sub_topics/1
  def destroy
    @rel_topic_sub_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rel_topic_sub_topic
      @rel_topic_sub_topic = RelTopicSubTopic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rel_topic_sub_topic_params
      params.fetch(:rel_topic_sub_topic, {})
    end
end
