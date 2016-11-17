require 'rails_helper'

RSpec.describe Donor, type: :model do
    
    before(:all) do
        @donor1 = Donor.create()
        @donor2 = Donor.create()
        Dedication.create(:donor => @donor1, :tier => 'Platinum', :published => true)
        Dedication.create(:donor => @donor1, :tier => 'Platinum', :published => false)
        Dedication.create(:donor => @donor1, :tier => 'Platinum', :published => false)
        
        Dedication.create(:donor => @donor1, :tier => 'Gold', :published => true)
        Dedication.create(:donor => @donor1, :tier => 'Gold', :published => true)
        Dedication.create(:donor => @donor1, :tier => 'Gold', :published => false)
        
        Dedication.create(:donor => @donor1, :tier => 'Silver', :published => true)
        Dedication.create(:donor => @donor1, :tier => 'Silver', :published => true)
        Dedication.create(:donor => @donor1, :tier => 'Silver', :published => true)
        Dedication.create(:donor => @donor2, :tier => 'Silver', :published => true)       
        Dedication.create(:donor => @donor2, :tier => 'Silver', :published => false)       
    end
    
    describe ".dedications_by_tier" do
        it "returns only published dedications" do
            expect(@donor1.dedications_by_tier(true)['Platinum'].length).to eq 1   
        end
        
        it "splits returned dedications by tier" do
            expect(@donor1.dedications_by_tier(true)['Gold'].length).to eq 2   
        end
        
        it "includes only that donor's dedications" do
            expect(@donor1.dedications_by_tier(true)['Silver'].length).to eq 3   
        end
    
        it "returns only unpublished dedications" do
            expect(@donor1.dedications_by_tier(false)['Platinum'].length).to eq 2   
        end
        
        it "splits returned dedications by tier" do
            expect(@donor1.dedications_by_tier(false)['Gold'].length).to eq 1   
        end
                
        it "includes only that donor's dedications" do
            expect(@donor1.dedications_by_tier(false)['Silver'].length).to eq 0   
        end
    end
end