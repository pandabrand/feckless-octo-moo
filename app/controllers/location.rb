Darksidetwo::App.controllers :location do
  
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
  post :delivery, :map => '/order' do
  	@items = params.find_all { |item| item[1].to_i > 0 }
  	session[:order] = Hash.new
  	session[:order][:items] = Hash[*@items.flatten]
    render 'location/delivery'
  end
end
