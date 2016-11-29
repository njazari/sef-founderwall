require 'will_paginate' 
class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
    has_one :user
    
    filterrific(
        available_filters: [:search_query])
    
    after_initialize do 
        if new_record? then if self.status.nil? then self.status = true end end end
    after_update do 
        if self.status_changed?
            Dedication.where(donor_id: self.id).each do |dedication|
                dedication.update(status: self.status)
            end 
        end
    end 
    
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
        num_or_conds = 2
        where(
            terms.map { |term|
            "(LOWER(donors.first_name) LIKE ? OR LOWER(donors.last_name) LIKE ?)"
            }.join(' AND '),
            *terms.map { |e| [e] * num_or_conds }.flatten
        )
    }
    
    def dedications_by_tier(published)
        dbt = Hash.new
        Dedication.tiers.each do |tier|
            dbt[tier] = Dedication.where(:donor => self.id, :tier => tier, :status => true, :published => published)
        end
        dbt
    end
    
end
