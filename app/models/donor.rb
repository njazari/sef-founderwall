class Donor < ActiveRecord::Base
    has_many :dedications
    has_many :hospitals, :through => :dedications
end
