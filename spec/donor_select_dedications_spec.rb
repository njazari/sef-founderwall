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
    
    describe ".published_dedications_by_tier" do
        it "returns only published dedications" do
            expect(@donor1.published_dedications_by_tier['Platinum'].length).to eq 1   
        end
        
        it "splits returned dedications by tier" do
            expect(@donor1.published_dedications_by_tier['Gold'].length).to eq 2   
        end
        
        it "includes only that donor's dedications" do
            expect(@donor1.published_dedications_by_tier['Silver'].length).to eq 3   
        end
    end
    
    describe ".unpublished_dedications_by_tier" do
        it "returns only unpublished dedications" do
            expect(@donor1.unpublished_dedications_by_tier['Platinum'].length).to eq 2   
        end
        
        it "splits returned dedications by tier" do
            expect(@donor1.unpublished_dedications_by_tier['Gold'].length).to eq 1   
        end
                
        it "includes only that donor's dedications" do
            expect(@donor1.unpublished_dedications_by_tier['Silver'].length).to eq 0   
        end
    end
end