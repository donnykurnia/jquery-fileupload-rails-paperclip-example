class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :edit, :update, :destroy]

  # GET /prompts
  # GET /prompts.json
  def index
    @prompts = Prompt.all
  end

  # GET /prompts/new
  def new
    @prompt = Prompt.create(uuid: SecureRandom.uuid)
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @prompt.destroy
    respond_to do |format|
      format.html { redirect_to prompts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prompt_params
      params.require(:prompt).permit(:uuid)
    end
end
