class InvestorsAdminController < ApplicationController
  layout "evolution"
	before_filter :authorize

  def index
    list
    render :action => 'list'
  end

  def list
    @investor_pages, @investors = paginate :investors, :per_page => 10
  end

  def edit
    @investor = Investor.find(params[:id])
  end

  def destroy
		Investor.find(params[:id]).ips.delete_all
    Investor.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def clear_ip
    Ip.delete_all
		reset_investor

    flash[:notice] = "Performances of investors have been cleared up."
    redirect_to :action => 'index'
  end

  def clear_all_investors
		Investor.delete_all
		Ip.delete_all
    flash[:notice] = "All investors have been removed."
    redirect_to :action => 'index'
  end

	def generate_investors
    if Pm.count == 0
      flash[:notice] = "Please create some portfolio managers before creating investors."
      redirect_to :controller => 'pms_admin', :action => 'generate'
      return
    elsif params[:memory_to] == ''
      flash[:notice] = 'Please specify the upper limit of memory'
      redirect_to :action => 'generate'
      return
    end
    
	  mf = params[:memory_from].to_i
	  mt = params[:memory_to].to_i
	  ms = params[:memory_step].to_i

		(mf..mt).step(ms) do |memory|
				unless Investor.find_by_memory(memory)
					investor = Investor.new
					investor.memory = memory
					investor.status = 'Waiting'
					investor.save
				end
		end

    if Investor.count == 0
      flash[:notice] = "There're too few periods for investor to evaluate." + 
                       "\nPlease import more periods or reduce PM maximum memory."
    else
      flash[:notice] = "Investors have been generated automatically."
    end
    redirect_to :action => 'index'
	end

	private

	def reset_investor
		Investor.find_all.each do |investor|
			investor.status = 'Waiting'
			investor.save
		end
	end

end
