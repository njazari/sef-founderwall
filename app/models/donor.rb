class Donor < ActiveRecord::Base
    has_many :dedications, :dependent => :destroy
    has_many :hospitals, :through => :dedications
end
