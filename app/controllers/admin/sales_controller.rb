class Admin::SalesController < Admin::BaseController
  def index
    @sales = Sale.all
  end

  def new
    @sales = Sale.new
  end

end
