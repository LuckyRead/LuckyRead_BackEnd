class RelFragmentSubTopicsController < ApplicationController
  before_action :set_rel_fragment_sub_topic, only: [:show, :update, :destroy]

  # GET /rel_fragment_sub_topics
  def index
    @rel_fragment_sub_topics = RelFragmentSubTopic.all

    render json: @rel_fragment_sub_topics
  end

  # GET /rel_fragment_sub_topics/1
  def show
    render json: @rel_fragment_sub_topic
  end

  # POST /rel_fragment_sub_topics
  def create
    @rel_fragment_sub_topic = RelFragmentSubTopic.new(rel_fragment_sub_topic_params)

    if @rel_fragment_sub_topic.save
      render json: @rel_fragment_sub_topic, status: :created, location: @rel_fragment_sub_topic
    else
      render json: @rel_fragment_sub_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rel_fragment_sub_topics/1
  def update
    if @rel_fragment_sub_topic.update(rel_fragment_sub_topic_params)
      render json: @rel_fragment_sub_topic
    else
      render json: @rel_fragment_sub_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rel_fragment_sub_topics/1
  def destroy
    @rel_fragment_sub_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rel_fragment_sub_topic
      @rel_fragment_sub_topic = RelFragmentSubTopic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rel_fragment_sub_topic_params
      params.fetch(:rel_fragment_sub_topic, {})
    end
end
