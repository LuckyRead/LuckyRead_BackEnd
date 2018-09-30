class SubtopicsController < ApplicationController
  before_action :set_subtopic, only: [:show, :update, :destroy]

  # GET /subtopics
  def index
    @subtopics = Subtopic.all

    render json: @subtopics
  end

  # GET /subtopics/1
  def show
    render json: @subtopic
  end

  # POST /subtopics
  def create
    @subtopic = Subtopic.new(subtopic_params)

    if @subtopic.save
      render json: @subtopic, status: :created, location: @subtopic
    else
      render json: @subtopic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subtopics/1
  def update
    if @subtopic.update(subtopic_params)
      render json: @subtopic
    else
      render json: @subtopic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subtopics/1
  def destroy
    @subtopic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtopic
      @subtopic = Subtopic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subtopic_params
      params.fetch(:subtopic, {})
    end
end
