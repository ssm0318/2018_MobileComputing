module Api
    module V1 
        class EventsController < ApplicationController
            before_action :authenticate_user!, except: [:index, :show, :search]
            before_action :set_event, only: [:show, :update, :destroy]

            def index
                @events = Event.order('created_at DESC')
                render 'events/index.json'
            end
        
            def show
                render 'events/show.json'
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

            def search
                @keyword = params[:keyword]
                eventSearch = Event.order('created_at DESC')
                eventSearch = eventSearch.search_event(@keyword).distinct if @keyword.present?

                render json: {status: 'SUCCESS', message:'search results', data: eventSearch}, status: :ok
            end

            def event_request
                event_id = params[:event_id]
                requester_id = params[:requester_id]
                er = EventRequest.create(event_id: event_id, requester_id: requester_id)

                render json: {status: 'SUCCESS', message: 'event request', data: er}, status: :ok
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
