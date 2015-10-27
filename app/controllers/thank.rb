Darksidetwo::App.controllers :thank do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  post :thanks, :map => '/thanks' do
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card => params[:stripeToken]
    )
    items = Array.new
    session[:order][:items].each{|id, qty| items.push({:type => 'sku', :parent => Stripe::Product.retrieve(id).skus.data.first.id, :quantity => qty})}
    
    @order = Stripe::Order.create(
      :currency => 'usd',
      :customer => customer.id,
      :items => items,
      :metadata => { "phone": session[:order][:phone], "address": session[:order][:address], "notes": session[:order][:notes] }
    )
    
    puts @order
    @order.pay :customer => customer.id
    render 'thank/thanks'
  end

end
