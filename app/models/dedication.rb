require 'will_paginate' 

class Dedication < ActiveRecord::Base

    after_initialize do 
        if new_record?
            if self.status.nil? then self.status = true end
        end 
    end 
        
    filterrific(
        available_filters: [:sorted_by, :with_hospital_id,
                            :search_query])
                            
    belongs_to :hospital
    belongs_to :donor
    
    # scope :search_query, lambda { |query|

    #   return nil if query.blank?
    
    #   terms = query.downcase.split(/\s+/)
    
    #   terms = terms.map { |e|
    #     (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    #   }
      
    #   num_or_conds = 2
    #   where(
    #     terms.map { |term|
    #       "(LOWER(donors.first_name.first_name) LIKE ? OR LOWER(donors.first_name.last_name) LIKE ?)"
    #     }.join(' AND '),
    #     *terms.map { |e| [e] * num_or_conds }.flatten
    #   )
    # }
    
    
    # scope :with_hospital_id, lambda { |hospital_ids|
    #     where(dedications.hospital_id: [*hospital_ids])
    # }
    
    scope :sorted_by, lambda { |sort_option|
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        case sort_option.to_s
        when /^dedication_/
            order("LOWER(dedications.dedication) #{ direction }")
        when /^donor_/
            includes(:donor).order('donors.first_name ASC')
        when /^hospital_/
            includes(:hospital).order('hospitals.name ASC')
        else
            raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
        end
    }
    
    def self.options_for_sorted_by 
        [
            ['Dedication', 'dedication_asc'],
            ['Donor', 'donor_asc'], 
            ['Hospital', 'hospital_asc']
        ]
    end
end