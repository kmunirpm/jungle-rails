class Admin::DashboardController < Admin::BaseController

  def show
    @products = Product.all.order(created_at: :desc)
    @categories = Category.all.order(created_at: :desc)
  end
end
