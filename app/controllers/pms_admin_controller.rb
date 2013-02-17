class PmsAdminController < ApplicationController
  layout "evolution"
	before_filter :authorize

  def index
    list
    render :action => 'list'
  end

  def list
    @pm_pages, @pms = paginate :pms #, :per_page => 10
  end

  def destroy
		Pm.find(params[:id]).pmps.delete_all
		Pm.find(params[:id]).pis.delete_all
		Pm.find(params[:id]).destroy

    # Reset all investors to avoid constraint conflicts.
		Ip.delete_all
    Investor.delete_all
		
		redirect_to :action => 'list'
  end

  def clear_pmp
    Pi.delete_all
    Pmp.delete_all
		Ip.delete_all

		Pm.find_all.each do |pm|
			pm.status = 'Waiting'
			pm.save
		end
		
		reset_investor
		
    flash[:notice] = "Performances of portfolio managers have been cleared up."
    redirect_to :action => 'index'
  end

  def clear_all_pms
    Pm.delete_all
    Pi.delete_all
    Pmp.delete_all
    Ip.delete_all

    # Reset investor status without deleting them all.
		reset_investor

    flash[:notice] = "All portfolio managers have been removed."
    redirect_to :action => 'index'
  end

	def generate_pms
    # TODO: user specific-portfolio quotes
    if Quote.count == 0
      flash[:notice] = "Please make sure quotes are imported before generating PMs."
      redirect_to :controller => 'import', :action => 'quote'
      return
    elsif params[:memory_to] == '' or params[:confidence_to] == ''
      flash[:notice] = 'Please specify the upper limit of memory and confidence.'
      redirect_to :action => 'generate'
      return
    end
        
	  mf = params[:memory_from].to_i
	  mt = params[:memory_to].to_i
	  ms = params[:memory_step].to_i
	  cf = params[:confidence_from].to_i
	  ct = params[:confidence_to].to_i
	  cs = params[:confidence_step].to_i

		(mf..mt).step(ms) do |memory|
			(cf..ct).step(cs) do |confidence|
				unless Pm.find_by_memory_and_confidence(memory, confidence)
					pm = Pm.new
					pm.memory = memory
					pm.confidence = confidence
					pm.status = 'Waiting'
					pm.save
				end
			end
		end

    # Reset all investors to avoid constraint conflicts.
		Ip.delete_all
		Investor.delete_all

		flash[:notice] = "Portfolio managers have been generated automatically," +
                     "\nand investors have been deleted."
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
