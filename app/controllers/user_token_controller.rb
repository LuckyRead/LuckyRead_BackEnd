class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.find_by(email: params[:auth][:email])
    render json: {
        jwt: auth_token.token,
        username: @user.username
      }, status: :created
  end
end
