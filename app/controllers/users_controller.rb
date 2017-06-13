class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  private

  def showNameProduct(number)
    #return the name of the product_id
    return Product.find(number).name
  end
  helper_method :showNameProduct

end
