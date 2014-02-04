class CalendarsController < ApplicationController
  def show
    @earth_cycles = EarthCycles.new(Time.now)
  end
end
