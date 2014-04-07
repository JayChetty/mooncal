class EarthCycles
  DAY_IN_SECONDS = 24 * 60 * 60

  AN_AXIS_TURNPOINT_N = Time.new(2012,12,21,11,12)
  YEAR_IN_DAYS = 365.24219
  YEAR_IN_SECONDS = YEAR_IN_DAYS * DAY_IN_SECONDS

  A_NEW_MOON = Time.new(2012,11,13,22,8)
  MOONTH_IN_DAYS = 29.53059
  MOONTH_IN_SECONDS = MOONTH_IN_DAYS * DAY_IN_SECONDS

  YEAR_IN_MOONTHS = (YEAR_IN_SECONDS/MOONTH_IN_SECONDS)

  def initialize(point_in_time)
    @point_in_time = point_in_time
    @year = Cycle.new(AN_AXIS_TURNPOINT_N, YEAR_IN_SECONDS)
    @moonth = Cycle.new(A_NEW_MOON, MOONTH_IN_SECONDS)
  end

  def year
    2013 + @year.cycles_since_anchor(@point_in_time)
  end

  def day_of_year
    @year.day_of_cycle(@point_in_time)
  end

  def day_of_moonth
    @moonth.day_of_cycle(@point_in_time)
  end

  def first_new_moon_of_year
    start_of_year = @year.start_of_cycle(@point_in_time)
    @moonth.start_of_next_cycle(start_of_year)
  end

  def first_new_day_of_moonth
    start_of_moonth = @moonth.start_of_cycle(@point_in_time)
    start_of_moonth.end_of_day
  end

  def moonth_of_year
    ((@point_in_time - first_new_moon_of_year)/MOONTH_IN_SECONDS).ceil
  end

  def to_s
    "The #{day_of_moonth} day of the #{moonth_of_year} moonth #{year}"
  end

  def number_of_moonths_in_year
    1 + ((YEAR_IN_SECONDS - first_moonth_lag)/MOONTH_IN_SECONDS).ceil
  end

  def number_of_days_in_moonth
    1 + ((MOONTH_IN_SECONDS - first_day_of_moonth_lag)/DAY_IN_SECONDS).ceil
  end

  def first_moonth_lag
    first_new_moon_of_year - @year.start_of_cycle(@point_in_time)
  end

  def first_day_of_moonth_lag
    first_new_day_of_moonth - @moonth.start_of_cycle(@point_in_time)
  end

end