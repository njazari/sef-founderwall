require 'will_paginate' 

class Dedication < ActiveRecord::Base

    after_initialize do 
        if new_record?
            if self.status.nil? then self.status = true end
        end 
    end 
        
    filterrific(
        available_filters: [:sorted_by,
                            :search_query])
                            
    belongs_to :hospital
    belongs_to :donor
    
    # scope :search_query, lambda { |query|

    #   return nil  if query.blank?
    
    #   # condition query, parse into individual keywords
    #   terms = query.downcase.split(/\s+/)
    
    #   # replace "*" with "%" for wildcard searches,
    #   # append '%', remove duplicate '%'s
    #   terms = terms.map { |e|
    #     (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    #   }
    #   # configure number of OR conditions for provision
    #   # of interpolation arguments. Adjust this if you
    #   # change the number of OR conditions.
    #   num_or_conds = 2
    #   where(
    #     terms.map { |term|
    #       "(LOWER(students.first_name) LIKE ? OR LOWER(students.last_name) LIKE ?)"
    #     }.join(' AND '),
    #     *terms.map { |e| [e] * num_or_conds }.flatten
    #   )
    # }
    
    scope :sorted_by, lambda { |sort_option|
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        case sort_option.to_s
        when /^dedication_/
            order("LOWER(dedications.dedication) #{ direction }")
        when /^donor_first_name_/
            order("LOWER(dedications.donor.first_name) #{ direction }").include(:donor)
        else
            raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
        end
    }
    
    def self.options_for_sorted_by 
        [
            ['Dedication(a-z)', 'dedication_asc'],
            ['Donor Name', 'donor_first_name_asc']
        ]
    end
end