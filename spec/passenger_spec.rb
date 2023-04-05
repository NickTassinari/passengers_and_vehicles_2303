require './lib/passenger'

RSpec.describe Passenger do 

  it 'exists and has readable attributes' do 
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})    

    expect(charlie.name).to eq("Charlie")
    expect(charlie.age).to eq(18)
  end

  it 'can check if passenger is adult' do 
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})    

    expect(charlie.adult?).to eq(true)
    expect(taylor.adult?).to eq(false)
  end

  it 'can check if there is a driver' do 
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})    

    expect(charlie.driver?).to eq(false)

    charlie.drive 
    expect(charlie.driver?).to eq(true)
  end
end