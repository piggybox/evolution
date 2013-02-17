class HelpController < ApplicationController
  layout "evolution"
	before_filter :authorize

  def ppt
    send_file "./doc/EF-presentation.ppt"
  end

  def index
    session[:step] = 1
  end
  
  def previous
    session[:step] -= 1
    render :update do |page|
      page.replace_html 'tut', :partial => 't' + session[:step].to_s
      page.hide 'previous' if session[:step] == 1
      page.show 'next'
    end
  end

  def next
    session[:step] += 1
    render :update do |page|
      page.replace_html 'tut', :partial => 't' + session[:step].to_s
      page.show 'previous'
      page.hide 'next' if session[:step] >= 6
    end 
  end
end
