Darksidetwo::App.controllers :purchase do
  
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
  
  layout :navbar
  post :purchase, :map => '/purchase' do
    items = session[:order][:items]
    session[:order][:phone] = params[:del_phone]
    session[:order][:address] = params[:address]
    session[:order][:notes] = params[:notes]
	@order_items = Hash.new
	items.each do|id, qty|
      @order_items[Stripe::Product.retrieve(id.to_s)] = qty unless id.to_s.start_with?('auth')
	end  
	@description = Array.new
	@order_items.each{|item, qty| @description.push(item.name + ": "  + qty)}
	@total = @order_items.keys.map{|product| product.skus.data.first.price * @order_items[product].to_i}.inject(0, &:+)
    render 'purchase/purchase_form'
  end

end
