class FragmentsController < ApplicationController
  before_action :set_fragment, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:create, :update, :destroy, :something]

  def something
    @user = User.find_by(username: params[:username])
    array = Fragment.Fragmentsubtopicwithprefecensuser(@user.id)
    render json: {Fragment: {:id => array[0], :title => array[1], :introduction => array[2], :content => array[3], :score => array[4], :source => array[5], :image_path => array[6]}}, status: :ok
  end

  # GET /fragments
  def index
    @fragments = Fragment.all.paginate(page: params[:page], per_page: 10)

    render json: @fragments
  end

  # GET /fragments/1
  def show
    render json: @fragment
  end

  # POST /fragments
  def create
    @fragment = Fragment.new(fragment_params)

    if @fragment.save
      render json: @fragment, status: :created, location: @fragment
    else
      render json: @fragment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fragments/1
  def update
    if @fragment.update(fragment_params)
      render json: @fragment
    else
      render json: @fragment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fragments/1
  def destroy
    @fragment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fragment
      @fragment = Fragment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fragment_params
      params[:fragment].permit(:title, :introduction, :content, :source, :users_id)
    end
end
