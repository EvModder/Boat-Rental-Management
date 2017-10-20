class BoatAttachmentsController < ApplicationController
  before_action :set_boat_attachment, only: [:show, :edit, :update, :destroy]

  # GET /boat_attachments
  # GET /boat_attachments.json
  def index
    @boat_attachments = BoatAttachment.all
  end

  # GET /boat_attachments/1
  # GET /boat_attachments/1.json
  def show
  end

  # GET /boat_attachments/new
  def new
    @boat_attachment = BoatAttachment.new
  end

  # GET /boat_attachments/1/edit
  def edit
  end

  # POST /boat_attachments
  # POST /boat_attachments.json
  def create
    @boat_attachment = BoatAttachment.new(boat_attachment_params)

    respond_to do |format|
      if @boat_attachment.save
        format.html { redirect_to @boat_attachment, notice: 'Boat attachment was successfully created.' }
        format.json { render :show, status: :created, location: @boat_attachment }
      else
        format.html { render :new }
        format.json { render json: @boat_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boat_attachments/1
  # PATCH/PUT /boat_attachments/1.json
  def update
    respond_to do |format|
      if @boat_attachment.update(boat_attachment_params)
        format.html { redirect_to @boat_attachment, notice: 'Boat attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @boat_attachment }
      else
        format.html { render :edit }
        format.json { render json: @boat_attachment.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /boat_attachments/1
  # DELETE /boat_attachments/1.json
  def destroy
    @boat_attachment.destroy
    respond_to do |format|
      format.html { redirect_to boat_attachments_url, notice: 'Boat attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat_attachment
      @boat_attachment = BoatAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_attachment_params
      params.require(:boat_attachment).permit(:boat_id, :image)
    end
end
