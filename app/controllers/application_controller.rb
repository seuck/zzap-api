#class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API
  #protect_from_forgery
  
  include ActionController::MimeResponds
  
  def redirect_to_zzap
    redirect_to "http://www.zzap.it"
  end
  
  def respond_with_json(item)
    respond_with do |format|
      format.json { render :json => item }
      format.js   { render :json => item, :callback => params[:callback] }
    end
  end
end
