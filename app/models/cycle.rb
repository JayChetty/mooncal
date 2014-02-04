class Cycle
  # attr_accessor :anchor, :length
  DAY_IN_SECONDS = 60*60*24
  def initialize(anchor, length_in_seconds)
    @anchor = anchor
    @length = length_in_seconds
  end

  def seconds_into_cycle(point_in_time)
    (point_in_time - @anchor).modulo(@length)
  end

  def fraction_of_cycle(point_in_time)
    seconds_into_cycle(point_in_time)/@length
  end

  def cycles_since_anchor(point_in_time)
    ((point_in_time - @anchor)/@length).floor
  end 

  def start_of_cycle(point_in_time)
    @anchor + (cycles_since_anchor(point_in_time) * @length)
  end

  def start_of_next_cycle(point_in_time)
    start_of_cycle(point_in_time) + @length
  end 

  def first_day_start_of_cycle(point_in_time)
    (start_of_cycle(point_in_time).to_date + 1).to_time
  end 

  def day_of_cycle(point_in_time)
    puts "pot #{point_in_time}"
    adjusted_time = point_in_time - first_day_start_of_cycle(point_in_time)    
    (adjusted_time/DAY_IN_SECONDS).ceil
  end 


end