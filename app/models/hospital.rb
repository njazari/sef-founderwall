class Hospital < ActiveRecord::Base
    has_many :dedications
    has_many :donors, :through => :dedications
    def self.options_for_select
        order('name').map { |e| [e.name, e.id] }
    end
    after_initialize do 
        if new_record? then if self.status.nil? then self.status = true end end end end 
