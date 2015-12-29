class LoginController < ApplicationController

  def index
    
  end

  def login
    cookies[:user_id] = params[:user_id]
    redirect_to root_path
  end

  private

  def document_params
    params.require(:document).permit(:title, :body)
  end
end
