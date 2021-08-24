class RoomsController < ApplicationController
    # Loads:
    # @rooms = all rooms
    # @room = current room when applicable
    before_action :load_entities
  
    def index
      @rooms = Room.all
      @destinatario = User.find_by_sql('select username from users, rooms where users.id = rooms.to AND dm = true')
      @remetente = User.find_by_sql('select username from users, rooms where users.id = rooms.user_id AND dm = true')
    end
  
    def new
      @room = Room.new
    end

    def create
      @room = Room.new permitted_parameters

  
      if @room.save
        flash[:success] = "Room #{@room.name} was created successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
  
    def edit
    end
    
    def show
      @destinatario = User.find_by_sql('select username from users, rooms where users.id = rooms.to AND dm = true')
      @remetente = User.find_by_sql('select username from users, rooms where users.id = rooms.user_id AND dm = true')
      @room_message = RoomMessage.new room: @room
      @room_messages = @room.room_messages.includes(:user)
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
  
    def load_entities
      @rooms = Room.all
      @room = Room.find(params[:id]) if params[:id]
    end
  
    def permitted_parameters
      params.require(:room).permit(:name, :dm, :user_id, :to)
    end
  end