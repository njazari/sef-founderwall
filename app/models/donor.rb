require 'will_paginate' 
require 'securerandom'

class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
    has_one :user
    
    rails_admin do
        list do
            include_all_fields
            field :user do
                filterable true
            end
        end
        
        export do 
            include_all_fields
            field :has_account do
                def value
                    bindings[:object].has_account
                end
            end
            field :signup_link do
                def value 
                    bindings[:object].signup_link
                end
            end
        end
    end

    after_initialize do 
        if new_record? 
            if self.status.nil? then self.status = true end 
            self.secret = SecureRandom.urlsafe_base64
        end 
    end
    after_update do 
        if self.status_changed?
            Dedication.where(donor_id: self.id).each do |dedication|
                dedication.update(status: self.status)
            end 
        end
    end 
    
    def after_import_save(record)
        if record.key?(:tier) and record[:tier].present?
            d = Dedication.where(donor_id: self.id, tier: nil).first
            d.tier = record[:tier]
            d.save
        end
    end
    
    def dedications_by_tier(published)
        dbt = Hash.new
        if published
            Dedication.tiers.each do |tier|
                dbt[tier] = Dedication.where(:donor => self.id, :tier => tier, :published => published)
            end
        else
             Dedication.tiers.each do |tier|
                dbt[tier] = Dedication.where(:donor => self.id, :tier => tier, :published => published)           
            end
        end
        dbt
    end
    
    def has_account
        if self.user != nil
            'true'
        else
            'false'
        end
    end
    
    def signup_link
        'sef-founderwall.herokuapp.com/users/sign_up?donor_id=' + self.id.to_s + '&secret=' + self.secret
    end
end
