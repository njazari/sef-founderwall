hospitals = [{:id => 1, :name => 'Sankara Rural Eye Hospital', :surgeries => 15000, :city => "Krishnankoil", :state => "Tamil Nadu", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Sankara Rural Eye Hospital"},
            {:id => 2, :name => 'Sankara Eye Hospital', :surgeries => 10000, :city => "Ludhiana", :state => "Punjab", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Sankara Eye Hospital"},
            {:id => 3, :name => 'Bangalore Hospital', :surgeries => 134546, :city => "Bengaluru", :state => "Karnataka", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Bangalore Hospitall"},
            {:id => 4, :name => 'Sankara Eye Hospital, Guntur', :surgeries => 25000, :city => "Guntur", :state => "Andhra Pradesh", :building_status => "Completed", :contact => "vmaddipati@gmail.com", :story => "This is the story of The Sankara Eye Hospital, Guntur"},
            {:id => 5, :name => 'Shimoga Hospital', :surgeries => 89307, :city => "Shimoga", :state => "Karnataka", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Shimoga Hospital"}
  	 ]

hospitals.each do |hospital|
  Hospital.create!(hospital)
end

donors = [{:id => 1, :first_name => 'Aaron', :last_name => 'Rowell', :email => 'AaronERowell@teleworm.us', :phone => '806-278-5037'},
        {:id => 2, :first_name => 'Mary', :last_name => 'Wilson', :email => 'MaryTWilson@dayrep.com', :phone => '847-509-8591'},
        {:id => 3, :first_name => 'Richard', :last_name => 'Krantz', :email => 'RichardMKrantz@rhyta.com', :phone => '503-616-7352'},
        {:id => 4, :first_name => 'Sandra', :last_name => 'Railey', :email => 'SandraDRailey@dayrep.com', :phone => '510-992-1438'},
        {:id => 5, :first_name => 'Ilana', :last_name => 'Miranda', :email => 'IlanaJMiranda@armyspy.com', :phone => '206-234-2513'},
        {:id => 6, :first_name => 'Teresa', :last_name => 'Bahr', :email => 'TeresaDBahr@teleworm.us', :phone => '773-718-0267'},
        {:id => 7, :first_name => 'Dennis', :last_name => 'Gain', :email => 'DennisAGain@teleworm.us', :phone => '630-922-7498'},
        {:id => 8, :first_name => 'Grace', :last_name => 'Wright', :email => 'GraceJWright@dayrep.com', :phone => '502-301-1405'},
        {:id => 9, :first_name => 'Kevin', :last_name => 'Curry', :email => 'Kcurry739@gmail.com', :phone => '415-338-8924'},
        {:id => 10, :first_name => 'Kobe', :last_name => 'James', :email => 'KobeBJ@yahoo.com', :phone => '639-671-3451'}
  	 ]

donors.each do |donor|
  Donor.create!(donor)
end

dedications = [{:id => 1, :dedication => 'No more blindness!', :status => true, :hospital_id => 2, :donor_id => 6, :tier => 'Gold'},
            {:id => 2, :dedication => 'For the kids', :status => true, :hospital_id => 2, :donor_id => 1, :tier => 'Platinum'},
            {:id => 3, :dedication => 'Dedicated to my family', :status => true, :hospital_id => 2, :donor_id => 3, :tier => 'Silver'},
            {:id => 4, :dedication => 'Keep up the good work', :status => true, :hospital_id => 1, :donor_id => 2, :tier => 'Gold'},
            {:id => 5, :dedication => '20/20 for all', :status => true, :hospital_id => 1, :donor_id => 4, :tier => 'Gold'},
            {:id => 6, :dedication => 'Go Sankara!', :status => true, :hospital_id => 3, :donor_id => 5, :tier => "Platinum"},
            {:id => 7, :dedication => 'Keep it up!', :status => true, :hospital_id => 3, :donor_id => 1, :tier => "Silver"},
            {:id => 8, :dedication => 'My favorite charity!', :status => true, :hospital_id => 4, :donor_id => 7, :tier => "Gold"},
            {:id => 9, :dedication => 'Happy to help a great cause', :status => true, :hospital_id => 5, :donor_id => 8, :tier => "Platinum"},
            {:id => 10, :dedication => 'Keep funding', :status => true, :hospital_id => 4, :donor_id => 9, :tier => "Silver"},
            {:id => 11, :dedication => 'I love Sankara', :status => false, :hospital_id => 1, :donor_id => 8, :tier => "Platinum"},
            {:id => 12, :dedication => 'I hate blindness!', :status => true, :hospital_id => 5, :donor_id => 10, :tier => "Gold"},
  	 ]

dedications.each do |dedication|
  Dedication.create!(dedication)
end