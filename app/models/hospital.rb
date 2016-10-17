class Hospital < ActiveRecord::Base
    has_many :dedications
    has_many :donors, :through => :dedications
end
