class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
    after_initialize do 
        if new_record?
            if self.status.nil? then self.status = true end
        end
    end 
end
