module Api
    module V1 
        class EventsController < ApplicationController
            before_action :authenticate_user!, except: [:index, :show, :search]
            before_action :set_event, only: [:show, :update, :destroy]
            include Geokit::Geocoders

            def index
                @events = Event.order('created_at DESC')
                render 'events/index.json'
            end
        
            def show
                render 'events/show.json'
            end
        
            def create
                @event = Event.create(host_id: params[:host_id], title: params[:title])
                @event.description = params[:description] if params[:description].present?
                if params[:location].present?
                    loc = GoogleGeocoder.geocode(params[:location]) 
                    @event.location = loc.full_address
                    @event.event_longitude = loc.lng
                    @event.event_latitude = loc.lat
                end
                @event.chatlink = params[:chatlink] if params[:chatlink].present?
                @event.hosted = false
                @event.tag_raw = params[:tag_raw] if params[:tag_raw].present?
                @event.save 

                if params[:tag_raw].present?
                    input_tag = @event.tag_raw
                    input_tag = input_tag.gsub(", ", ",")
                    tag_array = input_tag.split(',')
                    tag_array.each do |tag|
                        new_tag = Tag.create(event_id: @event.id, content: tag)
                        @event.tags << new_tag
                    end
                end
        
                if @event.save
                    render json: {status: 'SUCCESS', message:'Created event', data: @event}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Event not saved', data: @event.errors.full_messages}, status: :unprocessable_entity
                end
            end
        
            def destroy
                @event.destroy
                render json: {status: 'SUCCESS', message:'Deleted event', data: @event},status: :ok
            end
        
            def update
                @event.description = params[:description] if params[:description].present?
                if params[:location].present?
                    loc = GoogleGeocoder.geocode(params[:location]) 
                    @event.location = loc.full_address
                    @event.event_longitude = loc.lng
                    @event.event_latitude = loc.lat
                end
                @event.chatlink = params[:chatlink] if params[:chatlink].present?
                @event.hosted = false
                @event.tag_raw = params[:tag_raw] if params[:tag_raw].present?

                if params[:tag_raw].present?
                    @event.tags.destroy_all
                    input_tag = @event.tag_raw
                    input_tag = input_tag.gsub(", ", ",") # windows에서는 \r\n인데 mac에서는 \n이다.
                    tag_array = input_tag.split(",") 
                    tag_array.each do |tag|
                        new_tag = Tag.create(event_id: @event.id, content: tag)
                        @event.tags << Tag.find(new_tag.id)
                    end
                end

                if @event.save
                    render json: {status: 'SUCCESS', message:'Updated event', data: @event}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Event not updated', data: @event.errors.full_messages}, status: :unprocessable_entity
                end
            end

            def search
                @keyword = params[:keyword]
                event_search = Event.order('created_at DESC')
                if @keyword.present?
                    content = event_search.search_content(@keyword)
                    tag = event_search.search_tag(@keyword)
                    event_search = content + tag
                    event_search = event_search.uniq
                end

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

            def hosted 
                event_id = params[:id]
                e = Event.find(event_id)
                exp = e.exp
                e.update(exp: exp + 1)

                render json: {status: 'SUCCESS', message: 'event accept', data: e}, status: :ok
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
