class OverviewController < ApplicationController
    def index
        @entries = Entry.where(user_id: current_user.id)
        statistics
    end

    def statistics
        @entries = Entry.where(user_id: current_user.id)
        @average_length = @entries.average(:length)
        # @median_length = @entries.median(:length)
        @longest_entry = @entries.maximum(:length)
        @shortest_entry = @entries.minimum(:length)
      end
      
    
end
