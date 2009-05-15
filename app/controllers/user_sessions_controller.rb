class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [ :new, :create ]
  before_filter :require_user, :only => :destroy

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        flash[:success] = 'Login successful!'
        format.html { redirect_back_or_default(account_url) }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    current_user_session.destroy

    respond_to do |format|
      flash[:success] = 'Successfully logged out.'
      format.html { redirect_back_or_default(new_user_session_url) }
      format.xml  { head :ok }
    end
  end
end
