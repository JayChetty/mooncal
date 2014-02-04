class EarthCycles
  DAY_IN_SECONDS = 24 * 60 * 60

  AN_AXIS_TURNPOINT_N = Time.new(2012,12,21,11,12)
  YEAR_IN_DAYS = 365.24219
  YEAR_IN_SECONDS = YEAR_IN_DAYS * DAY_IN_SECONDS

  A_NEW_MOON = Time.new(2012,11,13,22,8)
  MONTH_IN_DAYS = 29.53059
  MONTH_IN_SECONDS = MONTH_IN_DAYS * DAY_IN_SECONDS

  def initialize(point_in_time)
    @point_in_time = point_in_time
    @year = Cycle.new(AN_AXIS_TURNPOINT_N, YEAR_IN_SECONDS)
    @month = Cycle.new(A_NEW_MOON, MONTH_IN_SECONDS)
  end

  def year
    2013 + @year.cycles_since_anchor(@point_in_time)
  end

  def day_of_year
    @year.day_of_cycle(@point_in_time)
  end

  def day_of_month
    @month.day_of_cycle(@point_in_time)
  end

  def first_new_moon_of_year
    start_of_year = @year.start_of_cycle(@point_in_time)
    @month.start_of_next_cycle(start_of_year)
  end  

  def month_of_year
    ((@point_in_time - first_new_moon_of_year)/MONTH_IN_SECONDS).ceil
  end

  def to_s
    "The #{day_of_month} day of the #{month_of_year} month #{year}"
  end
end