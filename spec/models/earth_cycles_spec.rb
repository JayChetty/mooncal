require 'spec_helper'

describe EarthCycles do
# axisturn Time.new(2012,12,21,11,12)
  it "should show the days since axis change" do 
    first_day_of_year = Time.new(2012,12,22,12,00)
    earth = EarthCycles.new(first_day_of_year)
    earth.day_of_year.should == 1  
  end

  it "should show the days since new moon" do 
    first_day_of_moonth = Time.new(2014,03,31,12,00)
    earth = EarthCycles.new(first_day_of_moonth)
    earth.day_of_moonth.should == 1  
  end

  it "should show the first new moonth of year" do
    day_of_year = Time.new(2014,6,6,12,00)
    earth = EarthCycles.new(day_of_year)
    earth.first_new_moon_of_year.should be_within(1.day).of(Time.new(2014,01,01,04,15,02))
  end

  it "should show the moonth of year" do
    point = Time.new(2013,6,12,12,00)
    earth = EarthCycles.new(point)
    earth.moonth_of_year.should == 6 
  end

  it "should show the number of moonths in year" do
    twofourteen = EarthCycles.new(Time.new(2014,6,12,12,00))
    twoseven = EarthCycles.new(Time.new(2017,6,12,12,00))
    twofourteen.number_of_moonths_in_year.should == 14
    twoseven.number_of_moonths_in_year.should == 14 
  end

  it "should show the number of days in moonth" do
    point = Time.new(2013,6,12,12,00)
    earth = EarthCycles.new(point)
    earth.number_of_days_in_moonth.should == 31
  end

end