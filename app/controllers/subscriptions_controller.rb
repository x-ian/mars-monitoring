class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /subscriptions
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to @subscription, notice: 'Subscription was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      redirect_to @subscription, notice: 'Subscription was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
    redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscription_params
      params.require(:subscription).permit(:name, :subscriber1_id, :subscriber2_id, :subscriber3_id, :subscriber3_id, :subscriber4_id, :subscriber5_id, :include_heartbeat, :include_alarm, :include_restart, :generate_alarm_from_heartbeat, :generate_restart_from_heartbeat)
    end
end
