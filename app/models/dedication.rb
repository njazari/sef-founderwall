require 'will_paginate' 

class Dedication < ActiveRecord::Base

    after_initialize do 
        if new_record?
            if self.status.nil? then self.status = true end
        end 
    end

    filterrific(
        available_filters: [:sorted_by, :search_query])
                            
    belongs_to :hospital
    belongs_to :donor
    
    scope :search_query, lambda { |query|
    # Searches the dedications table on the 'dedication' column.
    # Matches using LIKE, automatically appends '%' to each term.
    # LIKE is case INsensitive with MySQL, however it is case
    # sensitive with PostGreSQL. To make it work in both worlds,
    # we downcase everything.
    return nil  if query.blank?

    # check if query exists in any dedication
    terms = [query.to_s.downcase]
    terms = terms.map { |e|
        ('%' + e + '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 3
    joins(:donor).joins(:hospital).
    where(
        terms.map { |term|
        "(LOWER(dedications.dedication) LIKE ? OR
        LOWER(donors.first_name || ' ' || donors.last_name) LIKE ? OR
        LOWER(hospitals.name) LIKE ?)"
        }.join('AND'),
        *terms.map { |e| [e] * num_or_conds }.flatten
        # Mess with the AND/OR stuff to get first name last name working.
        )
    }

    scope :sorted_by, lambda { |sort_option|
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        case sort_option.to_s
        when /^dedication_/
            order("dedications.dedication #{ direction }")
        when /^donor_/
            order("donors.first_name #{ direction }").includes(:donor).includes(:hospital)
        when /^hospital_/
            order("hospitals.name #{ direction }").includes(:donor).includes(:hospital)
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
    
    def self.tiers
        ['Platinum', 'Gold', 'Silver'] # ordered list of tiers
    end
    
    def self.visible
        Dedication.where(:status => true, :published => true)
    end
end