class LoginController < ApplicationController
	#before_filter :authorize, :except => :login

	layout "evolution"

  def add_user
		if request.get?
			@user = User.new
		else
			@user = User.new(params[:user])
			if @user.save
        flash[:notice] = "#{@user.name.capitalize} is added."
				redirect_to :action => 'list_users'
			end
		end
  end

	def login
		if request.get?
			session[:user_id] = nil
			@user = User.new
		else
			@user = User.new(params[:user])
			logged_in_user = @user.try_to_login
			if logged_in_user
				session[:user_id] = logged_in_user.id
				jumpto = session[:jumpto] || { :controller => 'admin', :action => "index" }
				session[:jumpto] = nil
				redirect_to(jumpto)
			else
				flash[:notice] = "Invalid user/password combination"
			end
		end
	end

	def index
		redirect_to("/quotes_admin")
	end

  def logout
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to(:action => "login")
  end

  def delete_user
		id = params[:id]
		if User.calculate(:count, :id) == 1
      flash[:notice] = "Can't delete the last account."
      redirect_to :action => :list_users
    elsif id && user = User.find(id)
      begin
        user.destroy
        flash[:notice] = "User #{user.name} deleted"
        redirect_to :action => :list_users
      rescue
        flash[:notice] = "Can't delete that user"
        redirect_to :action => :list_users
      end
		end
  end
  
  def list_users
		@all_users = User.find(:all)
  end
end
