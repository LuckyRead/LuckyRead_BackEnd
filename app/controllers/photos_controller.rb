class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:photo_id, :upload_profile_photo]

  def photo_id
    render json: {id: current_user.photos_id}, status: :ok
  end

  def upload_profile_photo
    @photo = Photo.create(path: 'default',image: params[:image])
    @photo.save
    @photo.update_attribute(:path, @photo.image.url)
    @user = User.find(current_user.id)
    @user.photos_id = @photo.id
    render json: {photo: "uploaded"}, status: :created
  end

  def upload
    @photo = Photo.create(path: 'default',image: params[:image])
    @photo.save
    @photo.update_attribute(:path, @photo.image.url)
    render json: {id: @photo.id, path: @photo.path}, status: :created
  end

  # GET /photos
  def index
    @photos = Photo.all.paginate(page: params[:page], per_page: 10)

    render json: @photos
  end

  # GET /photos/1
  def show
    @temp_path = 'public'+Photo.find(params[:id]).path
    send_file @temp_path, :type => 'image/jpeg', :disposition => 'inline'
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.fetch(:photo, {})
    end
end
