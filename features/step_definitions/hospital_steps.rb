Given /^the following donors exist$/ do |table|
    Donor.create table.hashes
end

Given /^the following dedications exist$/ do |table|
    Dedication.create table.hashes
end

Given /^the following hospitals exist$/ do |table|
    Hospital.create table.hashes
end
