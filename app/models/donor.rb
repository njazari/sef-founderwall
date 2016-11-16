class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
    has_one :user
    
    after_initialize do 
        if new_record? then if self.status.nil? then self.status = true end end end
    after_update do 
        if self.status_changed?
            Dedication.where(donor_id: self.id).each do |dedication|
                dedication.update(status: self.status)
            end 
        end
    end 
    
    def nonempty_dedications_by_tier
        dbt = Hash.new
        Dedication.tiers.each do |tier|
            dbt[tier] = Dedication.where(:donor => self.id, :tier => tier, :status => true).where.not(:dedication => [nil, ''])
        end
        dbt
    end
    
    def new_dedications
        Dedication.where(:donor => self.id, :dedication => [nil, '']).where.not(:published => true)
    end
    
end
