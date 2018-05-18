class UsersController <  ApplicationController

  def show
    user = User.find(params[:id])
    render json: { status: true, token: user.auth_token, id: user.id}
  rescue
    render json: { status: false, token: nil}
  end

end