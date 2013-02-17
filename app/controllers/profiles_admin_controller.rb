class ProfilesAdminController < ApplicationController
  layout "evolution"
	before_filter :authorize
  auto_complete_for :profile, :name
  auto_complete_for :profile, :ticker                  
                 
  def index                                           
    list                                          
    render :action => 'list'     
  end                                                        
                                                      
  def list
    @drug = User.find(session[:user_id]).profiles.find(:all, :order => 'ticker', :include => 'industry')
    @profile_pages, @profiles = paginate_collection @drug, :page => params[:page]
  end

  def new
    @industry_list = Industry.find(:all, :order => 'name').map{|x| x.name}
  end
  
  # Add an existing stock to the user portfoio
  def add_stock                                             
		if params[:ok] # OK
			if params[:profile][:name] == '' # If choose to add by ticker
        profile = Profile.find_by_ticker params[:profile][:ticker]        
        unless profile.nil?  
          p = Portfolio.new
          p.profile = profile
          User.find(session[:user_id]).portfolios << p
        else
          flash[:notice] = "No such ticker called #{params[:profile][:ticker]}. Please re-select."
          redirect_to :action => 'new'
          return
        end
      else # If choose to add by company name
        profile = Profile.find_by_name params[:profile][:name]
        unless profile.nil?
          p = Portfolio.new
          p.profile = profile
          User.find(session[:user_id]).portfolios << p
        else
          flash[:notice] = "No such company name called #{params[:profile][:name]}. Please re-select."
          redirect_to :action => 'new'
          return          
        end  
      end
      reset_without_agent_reserved
      flash[:notice] = "#{profile.name}'s stock was successfully added to your portfolio."
      redirect_to :action => 'list'
		else # Cancel
			redirect_to :action => 'list'
		end
  end

  # Add an existing industry to the user portfoio
  def add_industry
		if params[:ok] # OK
      industry = Industry.find_by_name params[:industry][:name]
      industry.profiles.each do |profile|
        p = Portfolio.new
        p.profile = profile
        User.find(session[:user_id]).portfolios << p
      end
      
      # Reset status and delete all Pm/investors since quotes are clear.     
      reset_without_agent_reserved
      
      flash[:notice] = "#{industry.name} industry was successfully added to your portfolio."
      redirect_to :action => 'list'
		else # Cancel
			redirect_to :action => 'list'
		end
  end

	# Delete a stock profile
  def destroy
    Quote.delete_all ["profile_id = #{params[:id]}"]
    User.find(session[:user_id]).portfolios.find_by_profile_id(params[:id]).destroy
    
    # Restore the profile status if imported
    newp = Profile.find(params[:id])
    newp.status = 'Waiting'
    newp.quote_type = ''
    newp.save

    # Reset PM/investor status
    reset_with_agent_reserved
		
    flash[:notice] = newp.name + ' has been deleted from your portfolio,' + 
                     "\n and PM/investors have been reset."
    redirect_to :action => 'list'
  end

	# Empty the whole portfolio
  def clear_all
    # Walk around the read-only profiles
    User.find(session[:user_id]).profiles.each do |p|
      # Restore the profile status if imported
      newp = Profile.find(p.id)
      newp.status = 'Waiting'
      newp.quote_type = ''
      newp.save
      
      # Delete all quotes
      Quote.delete_all(["profile_id = #{p.id}"])
    end

    # Clear the user portfolio
    User.find(session[:user_id]).portfolios.each {|p| p.destroy}
        
    # Reset status and delete all Pm/investors since quotes are clear.
		reset_without_agent_reserved
		
    flash[:notice] = 'Your portfolio is empty now and PM/investor have been deleted.'
    redirect_to :action => 'index'
  end
	
end
