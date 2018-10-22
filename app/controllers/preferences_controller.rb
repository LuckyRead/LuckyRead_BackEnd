class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:add, :add_all]

  def add
    SubTopicsUser.create!(
      user_id: current_user.id,
      sub_topic_id: params[:sub_topic_id],
      score: 10
    )
    render json: {username: current_user.username, sub_topic_id: params[:sub_topic_id]}, status: :created
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

  # GET /preferences
  def index
    @preferences = Preference.all.paginate(page: params[:page], per_page: 10)

    render json: @preferences
  end

  # GET /preferences/1
  def show
    render json: @preference
  end

  # POST /preferences
  def create
    @preference = Preference.new(preference_params)

    if @preference.save
      render json: @preference, status: :created, location: @preference
    else
      render json: @preference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /preferences/1
  def update
    if @preference.update(preference_params)
      render json: @preference
    else
      render json: @preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /preferences/1
  def destroy
    @preference.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def preference_params
      params.fetch(:preference, {})
    end
end
