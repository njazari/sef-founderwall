require 'will_paginate' 
class Hospital < ActiveRecord::Base
    has_many :dedications
    has_many :donors, :through => :dedications
    
    filterrific(
        available_filters: [:search_query])
    
    scope :search_query, lambda { |query|
        # Searches the dedications table on the 'dedication' column.
        # Matches using LIKE, automatically appends '%' to each term.
        # LIKE is case INsensitive with MySQL, however it is case
        # sensitive with PostGreSQL. To make it work in both worlds,
        # we downcase everything.
        return nil  if query.blank?

        # condition query, parse into individual keywords
        terms = [query.downcase]

        # replace "*" with "%" for wildcard searches,
        # append '%', remove duplicate '%'s
        terms = terms.map { |e|
            ('%' + e + '%')
        }
        # configure number of OR conditions for provision
        # of interpolation arguments. Adjust this if you
        # change the number of OR conditions.
        num_or_conds = 1
        where(
            terms.map { |term|
            "(LOWER(hospitals.name) LIKE ?)"
            }.join(' AND '),
            *terms.map { |e| [e] * num_or_conds }.flatten
        )
    }
    
    def self.options_for_select
        order('name').map { |e| [e.name, e.id] }
    end
    
    after_initialize do 
        if new_record? then if self.status.nil? then self.status = true end end end
            
    def published_dedications_by_tier
        dbt = Hash.new
        Dedication.tiers.each do |tier|
            dbt[tier] = Dedication.where(:hospital => self.id, :tier => tier, :status => true, :published => true)
        end
        dbt
    end
end