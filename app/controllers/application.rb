class ApplicationController < ActionController::Base
  before_filter :set_charset

  def set_charset
    headers["Content-Type"] = "text/html; charset=utf-8"
  end				
  
	def authorize
		unless session[:user_id]
			flash[:notice] = "Please log in"
			session[:jumpto] = request.parameters
			redirect_to(:controller => "login", :action => "login")
		end
	end
	
	def paginate_collection(collection, options = {})    
    default_options = {:per_page => 10, :page => 1}
    options = default_options.merge options

    pages = Paginator.new self, collection.size, options[:per_page], options[:page]
    first = pages.current.offset
    last = [first + options[:per_page], collection.size].min
    slice = collection[first...last]
    return [pages, slice]
  end

  require 'erubis/helper/rails'
  suffix = 'erubis' 
  ActionView::Base.register_template_handler(suffix, Erubis::Helper::RailsTemplate)
  #Erubis::Helper::RailsTemplate.engine_class = Erubis::EscapedEruby ## or Erubis::PI::Eruby
  #Erubis::Helper::RailsTemplate.default_properties = { :escape=>true, :escapefunc=>'h' }
  

	private
  
	def redirect_to_index(msg = nil)
		flash[:notice] = msg if msg
		redirect_to(:controller => 'evolution', :action => 'index')
	end

	def reset_with_agent_reserved
		Pi.delete_all
		Pmp.delete_all
		Ip.delete_all

    # TODO: User-specific PM/investor
		Pm.find_all.each do |pm|
			pm.status = 'Waiting'
			pm.save
		end

		Investor.find_all.each do |investor|
			investor.status = 'Waiting'
			investor.save
		end
	end

  def reset_without_agent_reserved
		Pi.delete_all
		Pmp.delete_all
		Ip.delete_all

    # TODO: User-specific PM/investor
    Pm.delete_all
    Investor.delete_all
	end
	
end
		
    
