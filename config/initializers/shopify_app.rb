ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "f1bed68735c1a791cb1d4f7bb89bf126"
  config.secret = "7308644ba27901d832cba146d14b3254"
  config.scope = "read_orders,read_products,read_customers"
  config.embedded_app = true
  config.webhooks = [
    {topic: 'customers/create', address: 'https://d166494a.ngrok.io/webhooks/customers_create', format: 'json'},
    {topic: 'products/create', address: 'https://d166494a.ngrok.io/webhooks/product_create', format: 'json'},
    {topic: 'carts/update', address: 'https://d166494a.ngrok.io/webhooks/carts_update', format: 'json'}
  ]
end
