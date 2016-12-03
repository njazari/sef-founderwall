require 'will_paginate' 
require 'securerandom'

class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
    has_one :user
    
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
    
    def before_import_save(record)
        if record.key?(:tier) and record(:tier).present?
        end
    end
    
    def dedications_by_tier(published)
        dbt = Hash.new
        Dedication.tiers.each do |tier|
            dbt[tier] = Dedication.where(:donor => self.id, :tier => tier, :status => true, :published => published)
        end
        dbt
    end
    
    def signup_link
        'sef-founderwall.herokuapp.com/users/sign_up?donor_id=' + self.id.to_s + '&secret=' + self.secret
    end
end
