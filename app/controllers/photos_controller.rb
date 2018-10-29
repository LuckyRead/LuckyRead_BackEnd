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
      #UserMailer.change_photo(user).deliver_now
      render json: {user: {id_photo: @user.photos_id}}
    else
      render json: {error: 'Something was wrong'}
    end
  end

  def upload
    @photo = Photo.create(path: 'default',image: params[:image])
    @photo.save
    if @photo.image.url.nil?
      render json: {error: 'Empty image request'}, status: :bad_request
    else
      @photo.update_attribute(:path, @photo.image.url)
      @image_p = Base64.encode64(open('public'+@photo.path).read)
      File.open('public/uploads/images/image' + @photo.id.to_s + '.png', 'wb') do |f|
        f.write(Base64.decode64(@image_p))
      end
      @photo.base64_image = @image_p
      @photo.path = 'public/uploads/images/image' + @photo.id.to_s + '.png'
      if @photo.save
        render json: {id: @photo.id, path: @photo.path, direct_url: 'https://luckyread-backend.herokuapp.com/api/photo/' + @photo.id.to_s}, status: :created
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
    @photo = Photo.find(params[:id])
    if @photo.nil?
      render json: {error: "Photo id doesn't exist"}, status: :bad_request
    else
      File.open(@photo.path, 'wb') do |f|
        f.write(Base64.decode64(@photo.base64_image))
      end
      send_file @photo.path, :type => 'image/jpeg', :disposition => 'inline'
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
