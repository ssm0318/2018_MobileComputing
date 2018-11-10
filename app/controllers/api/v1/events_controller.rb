module Api
    module V1
        class EventsController < ApplicationController
            before_action :authenticate_user!, except: [:index, :show]
            before_action :set_event, only: [:show, :update, :destroy]

            def index
                @events = Event.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded events', data: @events}, status: :ok
            end
        
            def show
                render json: {status: 'SUCCESS', message:'Loaded event', data: @event}, status: :ok
            end
        
            def create
                event = Event.new(event_params)
        
                if event.save
                    render json: {status: 'SUCCESS', message:'Saved event', data: event}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Event not saved', data: event.errors.full_messages}, status: :unprocessable_entity
                end
            end
        
            def destroy
                @event.destroy
                render json: {status: 'SUCCESS', message:'Deleted event', data: @event},status: :ok
            end
        
            def update
                if @event.update_attributes(event_params)
                    render json: {status: 'SUCCESS', message:'Updated event', data: @event}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Event not updated', data: @event.errors.full_messages}, status: :unprocessable_entity
                end
            end

            private
                def set_event
                    @event = Event.find(params[:id])
                end
        
                def event_params
                    params.require(:event).permit(:id, :host_id, :title, :description, :location, :longitude, :latitude, :hosted, :reviewed)
                end
        end
    end
end
