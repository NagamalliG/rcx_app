ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "f1bed68735c1a791cb1d4f7bb89bf126"
  config.secret = "7308644ba27901d832cba146d14b3254"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
