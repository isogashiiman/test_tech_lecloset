class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @user = current_user  #because User.find(params[:id]) don't pass
  end


  private
  def productLiked?
    answer = Like.where(user_id: 2, product_id: 1).to_ary
    #checking the value of product liked
    if answer[0][:value] == (TrueClass || FalseClass)
      return answer[0][:value] #problem return nil instead of Booleans
    end
  end
  helper_method :productLiked?
end
