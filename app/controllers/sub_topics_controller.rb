class SubTopicsController < ApplicationController
  before_action :set_sub_topic, only: [:show, :update, :destroy]

  # GET /sub_topics
  def index
    @sub_topics = SubTopic.all

    render json: @sub_topics
  end

  # GET /sub_topics/1
  def show
    render json: @sub_topic
  end

  # POST /sub_topics
  def create
    @sub_topic = SubTopic.new(sub_topic_params)

    if @sub_topic.save
      render json: @sub_topic, status: :created, location: @sub_topic
    else
      render json: @sub_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_topics/1
  def update
    if @sub_topic.update(sub_topic_params)
      render json: @sub_topic
    else
      render json: @sub_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_topics/1
  def destroy
    @sub_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_topic
      @sub_topic = SubTopic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sub_topic_params
      params.require(:sub_topic).permit(:idsub_topic, :name)
    end
end
