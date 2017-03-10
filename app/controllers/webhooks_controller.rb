class WebhooksController < ShopifyApp::WebhooksController
 def cartsUpdate
    @success = 'success'
    render status: 200 , json: @success.to_json
 end
  def productCreate
      @success = 'success'
    #   Customers.connection.insert("INSERT INTO customers (id,first_name,last_name,points) VALUES (#{@id},'#{@first_name}','#{@last_name}',#{@points});")
      render status: 200 , json: @success.to_json
 end
 def customersCreate
      @id =  params[:id]
      @first_name = params[:first_name]
      @last_name = params[:last_name]
      @points = 100
    #   puts @id 
    #   puts @first_name
    #   puts @last_name
    #   puts @points
      Customers.connection.insert("INSERT INTO customers (id,first_name,last_name,points) VALUES (#{@id},'#{@first_name}','#{@last_name}',#{@points});")  
      @success = 'success'
     render status: 200 , json: @success.to_json
 end
end
