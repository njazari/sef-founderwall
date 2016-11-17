require 'rails_helper'

RSpec.describe Hospital, type: :model do
    
    before(:all) do
        @hospital1 = Hospital.create()
        @hospital2 = Hospital.create()
        Dedication.create(:hospital => @hospital1, :tier => 'Platinum', :published => true)
        Dedication.create(:hospital => @hospital1, :tier => 'Platinum', :published => false)
        Dedication.create(:hospital => @hospital1, :tier => 'Platinum', :published => false)
        
        Dedication.create(:hospital => @hospital1, :tier => 'Gold', :published => true)
        Dedication.create(:hospital => @hospital1, :tier => 'Gold', :published => true)
        Dedication.create(:hospital => @hospital1, :tier => 'Gold', :published => false)
        
        Dedication.create(:hospital => @hospital1, :tier => 'Silver', :published => true)
        Dedication.create(:hospital => @hospital2, :tier => 'Silver', :published => true)       
        Dedication.create(:hospital => @hospital2, :tier => 'Silver', :published => true)       
    end
    
    describe ".published_dedications_by_tier" do
        it "returns only published dedications" do
            expect(@hospital1.published_dedications_by_tier['Platinum'].length).to eq 1   
        end
        
        it "splits returned dedications by tier" do
            expect(@hospital1.published_dedications_by_tier['Gold'].length).to eq 2   
        end
        
        it "includes only that hospital's dedications" do
            expect(@hospital1.published_dedications_by_tier['Silver'].length).to eq 1   
        end
    end
end