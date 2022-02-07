class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
    @product_counts = Product.count
    @category_counts = Category.count
  end
end
