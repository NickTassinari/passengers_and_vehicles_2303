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
end