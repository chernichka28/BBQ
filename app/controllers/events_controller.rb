class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: %i[show destroy edit]
  before_action :password_guard!, only: [:show]

  after_action :verify_authorized, except: [:index]

  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build

    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)

    authorize @event

    if @event.save
      redirect_to @event, notice: I18n.t("controllers.events.created")
    else
      render :new
    end
  end


  def edit
    authorize @event
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: I18n.t("controllers.events.updated")
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
    redirect_to root_path, notice: I18n.t("controllers.events.destroyed")
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end

  def password_guard!
    return true if @event.pincode.blank?
    return true if policy(@event).edit?

    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    pincode = cookies.permanent["events_#{@event.id}_pincode"]
    unless @event.pincode_valid?(pincode)
      if params[:pincode].present?
        flash.now[:alert] = I18n.t("controllers.events.wrong_pincode")
      end
      render "pincode_form"
    end
  end
end
