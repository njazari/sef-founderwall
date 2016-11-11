class Dedication < ActiveRecord::Base
    belongs_to :hospital
    belongs_to :donor
    after_initialize do 
        if new_record?
            if self.status.nil? then self.status = true end
        end 
    end 
        
    filterrific(default_filter_params: { sorted_by: 'created_at_desc' },
        available_filters: [:sorted_by,
                            :search_query])
end