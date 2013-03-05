class ProfilesController < ApplicationController

  before_filter :check_user_sign_in?

  def check_user_sign_in?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def is_current_user?
    unless current_user.id.to_s == params[:id] then
      redirect_to( :action => :index ) and return
    end
  end

  # GET /profiles
  # GET /profiles.json
  def index
    current_user_id = current_user.id
    @profile = Profile.find(current_user_id) rescue nil

    if @profile == nil
      redirect_to :action => :new
    else
      redirect_to :controller => :profiles, :action => :show, :id => current_user_id
    end
    #@profiles = Profile.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @profiles }
    #end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    @posts = Post.find(:all, :conditions => { :user_id => @profile.user_id }, :limit => 10)
    @comments = Comment.find(:all, :conditions => { :to_user_id =>  @profile.user_id})
    #@follows = Follow.find(:all, :conditions =>)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    #is_current_user?

    @profile = Profile.new
    @profile.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    is_current_user?

    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    is_current_user?

    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    is_current_user?

    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    is_current_user?

    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
