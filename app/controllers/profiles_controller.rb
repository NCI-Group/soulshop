class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  before_filter :ensure_admin, :only => [:index]
  before_filter :valid_id, :only => [:show, :edit, :update, :destroy]



  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user = current_user #User.find(params[:id])
    #current_user
    @allProducts = Inventory.all
  end

  # GET /profiles/new
  def new
	@profile = Profile.new
	@profile.user_id = current_user.id

	respond_to do |format|
		format.html # new.html.erb
		format.json { render json: @profile }
	end
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def signedinuserprofile
		begin
			profile = Profile.find(current_user.id)
		rescue ActiveRecord::RecordNotFound
			redirect_to "/profiles/new"
		else
			@profile = profile
			redirect_to "/profiles/#{profile.id}"
		end
		#profile = Profile.find_by_user_id(current_user.id)
		#if profile.nil?
		#	redirect_to "/profiles/new"
		#else
		#	@profile = profile
		#	redirect_to "/profiles/#{@profile.id}"
		#end
	end

	def ensure_admin
		unless current_user && current_user.admin?
			render :text => "Access Error Message", :status => :unauthorized
		end
	end

	def valid_id
		if current_user.nil?
			render :text => "Cannot access profile while not signed in.", :status => :unauthorized
		end

		if current_user.id.to_s != params[:id].to_s
			if !current_user.admin?
				render :text => "Unable to access other users profiles.", :status => :unauthorized
			end
		end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
      @purchases = Purchase.where(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :address, :user_id)
    end
end
