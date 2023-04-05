class Passenger 
  attr_reader :name, :age, :driver 

  def initialize(attributes)
    @name = attributes.fetch("name")
    @age = attributes.fetch("age")
    @driver = false 
  end

  def adult? 
    if @age >= 18
      true 
    else 
      false 
    end
  end

  def driver? 
    @driver 
  end

  def drive 
    @driver = true 
  end
end