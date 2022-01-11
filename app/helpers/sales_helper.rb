module SalesHelper

  def active_sale?
    Sale.active.any?
    #Sale.active.for_city('Toronto').above(5).any This can be done as well if we define for_city and above methods
  end

end