class Dedication < ActiveRecord::Base
    belongs_to :hospital
    belongs_to :donor
end
