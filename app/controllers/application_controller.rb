#class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API
  #protect_from_forgery
  #after_filter :log_calls_to_db
  
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

  #private
  
  # Use request to log call IP
  #def log_calls_to_db
  #  Callslog.create(
  #    :url => request.original_url,
  #    :ip => request.ip,
  #    :method => request.method,
  #    :response_code => response.response_code,
  #    :date => Time.now
  #  )
  #end
end
