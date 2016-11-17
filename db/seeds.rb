hospitals = [{:id => 1, :name => 'Sankara Rural Eye Hospital', :surgeries => 15000, :city => "Krishnankoil", :state => "Tamil Nadu", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Sankara Rural Eye Hospital", :lat => 9.565389, :lng =>77.688760, :status => true},
            {:id => 2, :name => 'Sankara Eye Hospital', :surgeries => 10000, :city => "Ludhiana", :state => "Punjab", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Sankara Eye Hospital", :lat =>30.861098, :lng => 75.704154, :status => true},
            {:id => 3, :name => 'Bangalore Hospital', :surgeries => 134546, :city => "Bengaluru", :state => "Karnataka", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Bangalore Hospitall", :lat => 12.957378, :lng => 77.712852, :status => true},
            {:id => 4, :name => 'Sankara Eye Hospital, Guntur', :surgeries => 25000, :city => "Guntur", :state => "Andhra Pradesh", :building_status => "Completed", :contact => "vmaddipati@gmail.com", :story => "This is the story of The Sankara Eye Hospital, Guntur", :lat => 16.350630, :lng => 80.49328, :status => true},
            {:id => 5, :name => 'Shimoga Hospital', :surgeries => 89307, :city => "Shimoga", :state => "Karnataka", :building_status => "Completed", :contact => "info@giftofvision.org", :story => "This is the story of The Shimoga Hospital", :lat => 13.904054, :lng => 75.560752, :status => true}
  ]

hospitals.each do |hospital|
  if not Hospital.exists?(hospital[:id])
    Hospital.create!(hospital)
  elsif Hospital.find(hospital[:id]).status.nil?
    h = Hospital.find(hospital[:id])
    h.update(status: hospital[:status])
  end
end

donors = [{:id => 1, :first_name => 'Aaron', :last_name => 'Rowell', :email => 'AaronERowell@teleworm.us', :phone => '806-278-5037', :status => true},
        {:id => 2, :first_name => 'Mary', :last_name => 'Wilson', :email => 'MaryTWilson@dayrep.com', :phone => '847-509-8591', :status => true},
        {:id => 3, :first_name => 'Richard', :last_name => 'Krantz', :email => 'RichardMKrantz@rhyta.com', :phone => '503-616-7352', :status => true},
        {:id => 4, :first_name => 'Sandra', :last_name => 'Railey', :email => 'SandraDRailey@dayrep.com', :phone => '510-992-1438', :status => true},
        {:id => 5, :first_name => 'Ilana', :last_name => 'Miranda', :email => 'IlanaJMiranda@armyspy.com', :phone => '206-234-2513', :status => true},
        {:id => 6, :first_name => 'Teresa', :last_name => 'Bahr', :email => 'TeresaDBahr@teleworm.us', :phone => '773-718-0267', :status => true},
        {:id => 7, :first_name => 'Dennis', :last_name => 'Gain', :email => 'DennisAGain@teleworm.us', :phone => '630-922-7498', :status => true},
        {:id => 8, :first_name => 'Grace', :last_name => 'Wright', :email => 'GraceJWright@dayrep.com', :phone => '502-301-1405', :status => true},
        {:id => 9, :first_name => 'Kevin', :last_name => 'Curry', :email => 'Kcurry739@gmail.com', :phone => '415-338-8924', :status => true},
        {:id => 10, :first_name => 'Kobe', :last_name => 'James', :email => 'KobeBJ@yahoo.com', :phone => '639-671-3451', :status => true}
  	 ]

donors.each do |donor|
  if not Donor.exists?(donor[:id])
    Donor.create!(donor)
  elsif Donor.find(donor[:id]).status.nil?
    d = Donor.find(donor[:id])
    d.update(status: donor[:status])
  end
end

dedications = [{:id => 1, :dedication => 'No more blindness!', :status => true, :hospital_id => 2, :donor_id => 6, :tier => 'Gold', :published => true},
            {:id => 2, :dedication => 'For the kids', :status => true, :hospital_id => 2, :donor_id => 1, :tier => 'Platinum', :published => true},
            {:id => 3, :dedication => 'Dedicated to my family', :status => true, :hospital_id => 2, :donor_id => 3, :tier => 'Silver', :published => true},
            {:id => 4, :dedication => 'Keep up the good work', :status => true, :hospital_id => 1, :donor_id => 2, :tier => 'Gold', :published => true},
            {:id => 5, :dedication => '20/20 for all', :status => true, :hospital_id => 1, :donor_id => 4, :tier => 'Gold', :published => true},
            {:id => 6, :dedication => 'Go Sankara!', :status => true, :hospital_id => 3, :donor_id => 5, :tier => "Platinum"},
            {:id => 7, :dedication => 'Keep it up!', :status => true, :hospital_id => 3, :donor_id => 1, :tier => "Silver"},
            {:id => 8, :dedication => 'My favorite charity!', :status => true, :hospital_id => 4, :donor_id => 7, :tier => "Gold"},
            {:id => 9, :dedication => 'Happy to help a great cause', :status => true, :hospital_id => 5, :donor_id => 8, :tier => "Platinum"},
            {:id => 10, :dedication => 'Keep funding', :status => true, :hospital_id => 4, :donor_id => 9, :tier => "Silver"},
            {:id => 11, :dedication => 'I love Sankara', :status => false, :hospital_id => 1, :donor_id => 8, :tier => "Platinum", :published => true},
            {:id => 12, :dedication => 'I hate blindness!', :status => true, :hospital_id => 5, :donor_id => 10, :tier => "Gold"},
            {:id => 13, :hospital_id => 1, :donor_id => 2, :tier => "Silver"},
            {:id => 14, :hospital_id => 1, :donor_id => 3, :tier => "Silver"}
  	 ]

dedications.each do |dedication|
  if not Dedication.exists?(dedication[:id])
    Dedication.create!(dedication)
  elsif Dedication.find(dedication[:id]).status.nil?
    d = Dedication.find(dedication[:id])
    d.update(status: dedication[:status])
  end
end

users = [{:id => 1, :email => 'admin@admin.com', :password => 'password', :admin => true},
         {:id => 2, :email => 'user@user.com', :password => 'password', :admin => false}
  ]
  
users.each do |user|
  if not User.exists?(user[:id])
    User.create!(user)
  end
end