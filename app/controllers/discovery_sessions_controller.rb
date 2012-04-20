class DiscoverySessionsController < ApplicationController
  # GET /discovery_sessions
  # GET /discovery_sessions.json
  def index
    @discovery_sessions = DiscoverySession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discovery_sessions }
    end
  end

  # GET /discovery_sessions/1
  # GET /discovery_sessions/1.json
  def show
    @discovery_session = DiscoverySession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discovery_session }
    end
  end

  # GET /discovery_sessions/new
  # GET /discovery_sessions/new.json
  def new
    @discovery_session = DiscoverySession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discovery_session }
    end
  end

  # GET /discovery_sessions/1/edit
  def edit
    @discovery_session = DiscoverySession.find(params[:id])
  end

  # POST /discovery_sessions
  # POST /discovery_sessions.json
  def create

    user = nil
    i = Identity.find_by_RID(params[:discovery_session][:RID])
    user = i.user unless i.nil?
    if user.nil?
      render :nothing => true, :status => 404
    else
      @discovery_session = DiscoverySession.new
      @discovery_session.user = user
      @discovery_session.discovery_session_id = DiscoverySession.unique_session_id

      # FIX MΕ 
      respond_to do |format|
        if @discovery_session.save
#          format.json  { render :json => @discovery_session.to_session_number.to_json, :status => :created }
          format.json  { render :json => @discovery_session.to_json, :status => :created }
        else
          format.json  { render :json => @discovery_session.errors, :status => :unprocessable_entity }
        end
      end
    end

#remove scaffold code
#    @discovery_session = DiscoverySession.new(params[:discovery_session])
#
#    respond_to do |format|
#      if @discovery_session.save
#        format.html { redirect_to @discovery_session, notice: 'Discovery session was successfully created.' }
#        format.json { render json: @discovery_session, status: :created, location: @discovery_session }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @discovery_session.errors, status: :unprocessable_entity }
#      end
#    end 
#remove scaffold code

  end

  # PUT /discovery_sessions/1
  # PUT /discovery_sessions/1.json
  def update
    @discovery_session = DiscoverySession.find(params[:id])

    respond_to do |format|
      if @discovery_session.update_attributes(params[:discovery_session])
        format.html { redirect_to @discovery_session, notice: 'Discovery session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discovery_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discovery_sessions/1
  # DELETE /discovery_sessions/1.json
  def destroy
    @discovery_session = DiscoverySession.find(params[:id])
    @discovery_session.destroy

    respond_to do |format|
      format.html { redirect_to discovery_sessions_url }
      format.json { head :no_content }
    end
  end
end
