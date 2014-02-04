require 'spec_helper'

describe EarthCycles do
# axisturn Time.new(2012,12,21,11,12)
  it "should show the days since axis change" do 
    first_day_of_year = Time.new(2012,12,22,12,00)
    earth = EarthCycles.new(first_day_of_year)
    earth.day_of_year.should == 1  
  end

  it "should show the days since new moon" do 
    first_day_of_month = Time.new(2012,11,29,12,00)
    earth = EarthCycles.new(first_day_of_month)
    earth.day_of_month.should == 1  
  end

  it "should show the first new moonh of year" do
    day_of_year = Time.new(2012,12,25,12,00)
    earth = EarthCycles.new(day_of_year)
    earth.first_new_moon_of_year.to_i.should == Time.new(2012,12,28,03,29,02).to_i     
  end

  it "should show the month of year" do
    point = Time.new(2013,6,12,12,00)
    earth = EarthCycles.new(point)
    earth.month_of_year.should == 6 
  end
end