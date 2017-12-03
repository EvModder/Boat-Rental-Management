class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy, :remove_image]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_filter :authenticate_user!

  # GET /boats
  # GET /boats.json
  def index
    @boats = Boat.all
    #filtering, may suffer from SQL injection.
    #https://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
    @boats = @boats.state(params[:state]) if params[:state].present?
    @boats = @boats.city(params[:city]) if params[:city].present?
    @boats = @boats.capacity(params[:capacity]) if params[:capacity].present?
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    @boat_attachments = @boat.boat_attachments.all
    session[:boat_id] = @boat.id
    session[:boat_available_date] = @boat.available_date
  end

  # GET /boats/new
  def new
    @boat = Boat.new
    @boat_attachment = @boat.boat_attachments.build
  end

  def show_rents(id)
    @rents = Rent.where(boatid: id)
  end

  # GET /boats/1/edit
  def edit
  end
  # POST /boats
  # POST /boats.json
  def create
    @boat = Boat.new(boat_params)
    @boat.owner_name = current_user.first_name + ' ' + current_user.last_name
    @boat.ownerid = current_user.id
    respond_to do |format|
      if @boat.save
        params[:boat_attachments]['image'].each do |a|
          @boat_attachment = @boat.boat_attachments.create!(:image => a)
        end
        #below notice will cause strange position for rent button, will fix this later
        #format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
        format.html { redirect_to @boat}
        format.json { render :show, status: :created, location: @boat }
      else
        format.html { render :new }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_boat
    @boat = Boat.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def boat_params
    params.require(:boat).permit(:ownerid, :name, :width, :depth, :height, :water, :capacity, :state, :city, :description, :available_date, :price, :location, :video, boat_attachments_attributes: [:id, :boat_id, :image])
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end