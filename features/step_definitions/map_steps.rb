Given(/^the wall is set up$/) do
  end

Given(/^the following hospitals exist\$$/)  do |hospitals|
  hospitals.hashes.each do |table|
    Hospital.create!(table)
  end
end


