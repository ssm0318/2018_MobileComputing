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
                input_tag = event.tag_raw
                input_tag = input_tag.gsub(", ", ",")
                tag_array = input_tag.split(',')
                tag_array.each do |tag|
                    new_tag = Tag.create(event_id: event.id, content: tag)
                    event.tags << new_tag
                end
        
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
                    @event.tags.destroy_all
                    input_tag = @event.tag_raw
                    input_tag = input_tag.gsub(", ", ",") # windows에서는 \r\n인데 mac에서는 \n이다.
                    tag_array = input_tag.split(",") 
                    tag_array.each do |tag|
                        new_tag = Tag.create(event_id: @event.id, content: tag)
                        @event.tags << Tag.find(new_tag.id)
                    end
                    render json: {status: 'SUCCESS', message:'Updated event', data: @event}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Event not updated', data: @event.errors.full_messages}, status: :unprocessable_entity
                end
            end

            def search
                @keyword = params[:keyword]
                event_search = Event.order('created_at DESC')
                event_search = event_search.search_event(@keyword).distinct if @keyword.present?

                render json: {status: 'SUCCESS', message:'search results', data: event_search}, status: :ok
            end

            def event_request
                event_id = params[:event_id]
                requester_id = params[:requester_id]
                event_request = EventRequest.create(event_id: event_id, requester_id: requester_id)

                render json: {status: 'SUCCESS', message: 'event request', data: event_request}, status: :ok
            end

            def accept_event_request
                event_id = params[:event_id]
                user_id = params[:user_id]
                event_attending = EventAttending.create(event_id: event_id, user_id: user_id)

                render json: {status: 'SUCCESS', message: 'event accept', data: event_attending}, status: :ok
            end

            def bookmark
                event_id = params[:event_id]
                user_id = params[:user_id]
                bookmark = Bookmark.create(event_id: event_id, user_id: user_id)

                render json: {status: 'SUCCESS', message: 'event accept', data: bookmark}, status: :ok
            end

            private
                def set_event
                    @event = Event.find(params[:id])
                end
        
                def event_params
                    params.require(:event).permit(:id, :host_id, :title, :description, :location, :event_longitude, :event_latitude, :chatlink, :hosted, :tag_string)
                end
        end
    end
end
