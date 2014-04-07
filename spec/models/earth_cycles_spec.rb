require 'spec_helper'

describe EarthCycles do
# axisturn Time.new(2012,12,21,11,12)
  it "should show the days since axis change" do 
    first_day_of_year = Time.new(2012,12,22,12,00)
    earth = EarthCycles.new(first_day_of_year)
    earth.day_of_year.should == 1  
  end

  it "should show the days since new moon" do 
    first_day_of_month = Time.new(2014,03,31,12,00)
    earth = EarthCycles.new(first_day_of_month)
    earth.day_of_month.should == 1  
  end

  it "should show the first new moonth of year" do
    day_of_year = Time.new(2014,6,6,12,00)
    earth = EarthCycles.new(day_of_year)
    earth.first_new_moon_of_year.should be_within(1.day).of(Time.new(2014,01,01,04,15,02))
  end

  it "should show the month of year" do
    point = Time.new(2013,6,12,12,00)
    earth = EarthCycles.new(point)
    earth.month_of_year.should == 6 
  end
end