class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # just for the sake of testing
  skip_before_action :verify_authenticity_token

  private
  def redirect_to_root_with_msg msg
    flash[:danger] = msg
    respond_to do |format|
     format.html { redirect_to root_url }
    end
  end
end
