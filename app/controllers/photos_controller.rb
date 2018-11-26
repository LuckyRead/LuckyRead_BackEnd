require "base64"
class PhotosController < ApplicationController
  before_action :set_photo, only: [:update, :destroy]
  before_action :authenticate_user,  only: [:photo_id, :set_profile_photo]

  def favicon
    send_file 'public/favicon.ico', type: 'image/x-icon', disposition: 'inline'
  end

  def photo_id
    render json: {id: current_user.photos_id}, status: :ok
  end

  def set_profile_photo
    @user = User.find(current_user.id)
    @user.photos_id = params[:id_photo]
    if @user.save
      UserMailer.change_photo(@user).deliver_now
      render json: {user: {id_photo: @user.photos_id}}
    else
      render json: {error: 'Something was wrong'}
    end
  end

  def upload
    @photo = Photo.create(image: params[:image])
    @photo.save
    if @photo.image.url.nil?
      render json: {error: 'Empty image request'}, status: :bad_request
    else
      @photo.base64_image = Base64.encode64(open('public'+@photo.image.url).read)
      if @photo.save
        render json: {id: @photo.id, base64_image: @photo.base64_image.gsub("\n","")}, status: :created
      else
        render json: {error: 'Something was wrong'}, status: :bad_request
      end
    end
  end

  # GET /photos
  def index
    @photos = Photo.all.paginate(page: params[:page], per_page: 10)
    render json: @photos
  end

  # GET /photos/1
  def show
    if params[:id] == 'null'
      render json: {image_id: nil , base64_image: Photo.find(24).base64_image}
    else
      @photo = Photo.find(params[:id])
      if @photo.nil?
        render json: {error: "Photo id doesn't exist"}, status: :bad_request
      else
        render json: {image_id: @photo.id, base64_image: @photo.base64_image}, status: :ok 
      end
    end
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
