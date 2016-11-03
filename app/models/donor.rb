class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
    after_initialize do 
        if new_record? then if self.status.nil? then self.status = true end end end
    after_update do 
        if self.status_changed?
            Dedication.where(donor_id: self.id).each do |dedication|
                dedication.update(status: self.status)
            end end end end
