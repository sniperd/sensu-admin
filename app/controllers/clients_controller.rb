class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def destroy
    if current_user.read_only?
      respond_to do |format|
        format.json { render :json => false }
      end
    else
      resp = Client.destroy(params[:id])
      respond_to do |format|
        format.json { render :json => {:data => (resp == 202).to_s}.to_json }
      end
    end
  end
end
