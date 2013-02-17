class QuotesAdminController < ApplicationController
  layout "evolution"
	before_filter :authorize

  def index
    list
    render :action => 'list'
  end

  def list
    # TODO: show portfolio-specific quotes, can be very slow
    #User.find(session[:user_id]).profiles
    @quote_pages, @quotes = paginate :quotes, :per_page => 10, :order => 'ticker'
  end

	# Clear the quote of specified stock
  def clear_all
    # Walk around the read-only profiles
    User.find(session[:user_id]).profiles.each do |p|
      #Reset the status
      newp = Profile.find(p.id)
      newp.status = 'Waiting'
      newp.quote_type = ''
      newp.save

      # Delete all quotes
      Quote.delete_all(["profile_id = #{p.id}"])
    end
    
    # Reset status and delete all Pm/investors since quotes are clear.
    reset_without_agent_reserved
  
    flash[:notice] = "All quotes and PM/investors have been removed," + 
                     "\nyet your portfolio structure is reserved."
    redirect_to :controller => 'quotes_admin', :action => 'list'
  end

  # Append new quotes periodically
  def append
		# TODO
  end

end
