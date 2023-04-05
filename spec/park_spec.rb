require './lib/park'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe Park do 
  describe '#intialize' do 
    it 'exists and has readable attributes' do 

      yellowstone = Park.new("Yellowstone", 15)

      expect(yellowstone).to be_a(Park)
      expect(yellowstone.name).to eq("Yellowstone")
      expect(yellowstone.admission_price).to eq(15)
    end
  end 

  describe '#add_vehicle and #vehicle' do 
    it 'can keep track of vehicles that enter' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      yellowstone = Park.new("Yellowstone", 15)

      expect(yellowstone.vehicles).to eq([])

      yellowstone.add_vehicle(vehicle)

      expect(yellowstone.vehicles).to eq([vehicle])
    end
  end 

  describe '#attendees' do 
    it 'can keep track of passengers in park' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      yellowstone = Park.new("Yellowstone", 15)
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
      vehicle.add_passenger(charlie)    
      vehicle.add_passenger(jude)    
      vehicle.add_passenger(taylor)
      yellowstone.add_vehicle(vehicle)

      expect(yellowstone.attendees).to eq([charlie, jude, taylor])
    end
  end 

  describe '#calculate_revenue' do 
    it 'can calculate revenue' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      yellowstone = Park.new("Yellowstone", 15)
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
      vehicle.add_passenger(charlie)    
      vehicle.add_passenger(jude)    
      vehicle.add_passenger(taylor)
      yellowstone.add_vehicle(vehicle)

      expect(yellowstone.calculate_revenue).to eq(30)
    end
  end 


  #iteration 4 

  describe '#all_attendees' do 
    it 'can list all attendees by name alphabetically' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      yellowstone = Park.new("Yellowstone", 15)
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
      vehicle.add_passenger(taylor)    
      vehicle.add_passenger(jude)    
      vehicle.add_passenger(charlie)
      yellowstone.add_vehicle(vehicle)
    #i added passengers out of order to make them not already alphabetized 
      expect(yellowstone.all_attendees).to eq(["Charlie", "Jude", "Taylor"])
    end 
  end

  describe '#all_minors' do 
    it 'can list all minors alphabetically' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      yellowstone = Park.new("Yellowstone", 15)
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
      jenkins = Passenger.new({"name" => "Jenkins", "age" => 9})
      vehicle.add_passenger(taylor)    
      vehicle.add_passenger(jude)    
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jenkins)
      yellowstone.add_vehicle(vehicle)

      expect(yellowstone.all_minors).to eq(["Jenkins", "Taylor"])
    end
  end

  describe '#all_adults' do 
    it 'can list all adults alphabetically' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      yellowstone = Park.new("Yellowstone", 15)
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
      jenkins = Passenger.new({"name" => "Jenkins", "age" => 9})
      vehicle.add_passenger(taylor)    
      vehicle.add_passenger(jude)    
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jenkins)
      yellowstone.add_vehicle(vehicle)

      expect(yellowstone.all_adults).to eq(["Charlie", "Jude"])
    end
  end
end