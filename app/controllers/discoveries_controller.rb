class DiscoveriesController < ApplicationController

  def show
    session_id = params[:session_id]
    operation_name = params[:operation_name]
    @discovery = Discovery.make_from_session_id_and_attribute_name(session_id, operation_name)
    if @discovery.nil?
      render :nothing => true, :status => 404
    else
      respond_to do |format|
        format.json {render :json => @discovery}
      end
    end
  end
end
