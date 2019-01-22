# coding: utf-8
class EventsController < ApplicationController

  before_action :set_event, only: [:destroy, :update, :edit]
  before_action :set_user, onlly: [:index, :edit]
  before_action -> {disallow_unless_admin_or_user(@user)}

  def index
    @mod, @orga = Event.where(user_id: @user).partition { |e| e.relationship == 'moderation' }
    @event = Event.new
    @subnav_active = "events"
  end

  def new
    @event = Event.new
    @subnav_active = "events"
  end

  def create
    params = event_params
    params['relationship'] = event_params['relationship'].to_i
    params['user_id'] = @user.id
    @event = Event.new(params)
    if @event.save
      redirect_to user_events_path(@user), notice: "Veranstaltung hinzugefügt!"
    else
      render :new
    end
  end

  def edit
    @subnav_active = "events"
  end

  def update
    params = event_params
    params['relationship'] = event_params['relationship'].to_i
    if @event.update(params)
      redirect_to user_events_path(@user), notice: "Veranstaltung erfolgreich geändert!"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to user_events_path(current_user), notice: "Veranstaltung erfolgreich gelöscht!"
  end

  private

  def authenticate_user
    current_user
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_event
    @event = Event.find(params['id'])
  end

  def event_params
    params.require(:event).permit(
      :id,
      :name,
      :url,
      :city,
      :relationship
    )
  end
end
