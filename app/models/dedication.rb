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
    
    scope :search_query, lambda { |query|
        # Searches the dedications table on the 'dedication' column.
        # Matches using LIKE, automatically appends '%' to each term.
        # LIKE is case INsensitive with MySQL, however it is case
        # sensitive with PostGreSQL. To make it work in both worlds,
        # we downcase everything.
        return nil  if query.blank?

        # condition query, parse into individual keywords
        terms = query.downcase.split(/\s+/)

        # replace "*" with "%" for wildcard searches,
        # append '%', remove duplicate '%'s
        terms = terms.map { |e|
            (e.gsub('*', '%') + '%').gsub(/%+/, '%')
        }
        # configure number of OR conditions for provision
        # of interpolation arguments. Adjust this if you
        # change the number of OR conditions.
        num_or_conds = 1
        where(
            terms.map { |term|
            "(LOWER(dedications.dedication) LIKE ?)"
            }.join(' AND '),
            *terms.map { |e| [e] * num_or_conds }.flatten
        )
    }
    
    def self.options_for_sorted_by 
        [
            ['Dedication', 'dedication_asc'],
            ['Donor', 'donor_asc'], 
            ['Hospital', 'hospital_asc']
        ]
    end
    
    def self.tiers
        ['Platinum', 'Gold', 'Silver'] # ordered list of tiers
    end
end