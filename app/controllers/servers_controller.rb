class ServersController < ApplicationController
  include EC2Usable
  before_action :set_account, only: [:index, :setting]
  before_action :set_server, only: [:setting]

  # GET /servers
  # GET /servers.json
  def index
    account = Account.find(params[:account_id])
    @instances = obtain_instances(account.id, account.account_regions.first.region)

    @servers = {}
    @instances.each do |instance|
      @servers[instance.instance_id] = Server.find_by(instance_id: instance.instance_id) || @account.servers.create(instance_id: instance.instance_id)
    end
  rescue => e
    render text: e.message
  end

  # GET /servers/1/edit
  def edit
  end

  # GET /servers/:instance_id/setting
  def setting
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
    def set_account
      @account = Account.find(params[:account_id])
    end

    def set_server
      @server = @account.servers.find_or_create_by(instance_id: params[:instance_id])
    end

    def server_params
      params.require(:server).permit(:start_time, :end_time, :description, :shutdown)
    end
end
