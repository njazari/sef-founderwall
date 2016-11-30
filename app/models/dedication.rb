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
    
    rails_admin do
        list do
            field :dedication
            field :tier
            field :donor
            field :donor_name do
                def value
                    bindings[:object].donor.first_name + ' '  + bindings[:object].donor.last_name
                end
            end
            field :hospital
        end
        export do 
            field :tier
            field :donor_name do
                def value
                    bindings[:object].donor.first_name + ' ' + bindings[:object].donor.last_name
                end
            end
            field :hospital_name do
                def value
                    bindings[:object].hospital.name
                end
            end
            field :donor_email do
                def value
                    bindings[:object].donor.email
                end
            end
            field :donor_has_account do
                def value
                    bindings[:object].donor.user != nil
                end
            end
        end
    end
  
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
    
    def self.tiers
        ['Platinum', 'Gold', 'Silver'] # ordered list of tiers
    end
    
    def self.visible
        Dedication.where(:status => true, :published => true)
    end
end