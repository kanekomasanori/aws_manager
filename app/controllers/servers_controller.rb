require 'aws-sdk'

class ServersController < ApplicationController
  before_action :set_server, only: [:update]

  # GET /servers
  # GET /servers.json
  def index
    account = Account.find(params[:account_id])
    AWS.config access_key_id: account.access_key_id, secret_access_key: account.secret_access_key
    ec2 = AWS::EC2::Client.new(region: 'ap-northeast-1')
    @instances = ec2.describe_instances[:instance_index]
    @servers = {}
    Server.where(instance_id: @instances.keys).each do |server|
      @servers[server.instance_id] = server
    end
  rescue => e
    render text: e.message
  end

  # GET /servers/1/edit
  def edit
    @server = Server.find_or_create_by(instance_id: params[:instance_id])
  end

  # GET /servers/:instance_id/setting
  def setting
    @server = Server.find_or_create_by(instance_id: params[:instance_id])
    render :edit
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to servers_url, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:start_time, :end_time, :description, :shutdown)
    end
end
