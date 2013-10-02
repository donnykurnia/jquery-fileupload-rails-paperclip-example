class UploadsController < ApplicationController
  before_action :set_prompt, only: [:index, :create]
  before_action :set_upload, only: [:destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = @prompt.uploads
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = @prompt.uploads.build(upload: upload_params[:upload][0], title: upload_params[:title][0])

    respond_to do |format|
      if @upload.save
        format.html {
          render :json => [@upload.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: @upload }
      else
        format.html {
          render json: @upload.errors.to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:prompt_id])
    end

    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit({upload: []}, {title: []})
    end
end
