class RoomsController < ApplicationController
  def index
    @pagy, @rooms = pagy(Room.all)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create! permitted_parameters
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
    flash[:error] = e.message
  end

  def edit
  end

  def show
    @current_room = Room.find(params[:id])
    @pagy_rooms, @rooms = pagy(Room.all)
    @pagy_rooms, @users = pagy(User.excluding(current_user))
    @room = Room.new
    @message = RoomMessage.new
    @messages = @current_room.room_messages.includes(:user).last(5)

    render :index
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
