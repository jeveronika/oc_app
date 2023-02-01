require 'simple_stats'

class OverviewController < ApplicationController
    before_action :set_entry, only: %i[ show edit update destroy ]
    before_action :authenticate_user!

    def index
        @entries = Entry.where(user_id: current_user.id)
        statistics
        statistics_clients
        
    end

    private

    def statistics
        @entries = Entry.where(user_id: current_user.id)
        @entries_summary = @entries.count(:length)
        @average_length = @entries.average(:length)
        @median_length = @entries.median(&:length)
        @longest_entry = @entries.maximum(:length)
        @shortest_entry = @entries.minimum(:length)
        
        @entries_by_name = current_user.entries.group_by(&:name)
        @max_duration_client_name = @entries_by_name.max_by{|name, entries| entries.map(&:length).sum}.first
    end

    def statistics_clients
        @entries_by_name = Entry.where(user_id: current_user.id).all.group_by(&:name)
    end
      


      
    
end
