class Park 
  attr_reader :name, :admission_price, :vehicles, :passengers

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def attendees
    @vehicles.flat_map {|vehicle| vehicle.passengers}
  end

  def calculate_revenue
    revenue = 0 
    @vehicles.map do |vehicle|
      revenue += vehicle.num_adults * admission_price
    end
    revenue 
  end

  def all_attendees
    attendees.map do |attendee|
      attendee.name 
    end.sort 
  end

  def all_minors 
    attendees.select {|attendee| !attendee.adult?}.map do |minor|
      minor.name 
    end.sort 
  end 

  def all_adults 
    attendees.select {|attendee| attendee.adult?}.map do |adult|
      adult.name 
    end.sort 
  end
end