class Api::IssuesController < ApplicationController
  
  respond_to :json
  
  def show
    # find :first returns null if record not found
    @issue = Issue.find_for_api(params) if params[:id]
    respond_with_json @issue
  end
  
end
