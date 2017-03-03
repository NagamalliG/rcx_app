class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
      @shop = Shop.all
      @tiers = Tiers.all
      @programs = Programs.all
      puts "get the data from shpos "
  end
end
