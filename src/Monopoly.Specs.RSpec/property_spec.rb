require File.dirname(__FILE__) + '/spec_helper'
include System::Collections::Generic

describe Utility do
  before :each do
    @utility = Utility.new
    @utility.name = "Water Works"
  end
  
  it 'should have a mortgage value of 75' do
    @utility.mortgage_value.should be(75)
  end
  
  describe 'when returning the rent due' do
    before :each do
      @roll = 8
    end
    
    describe 'and only one utility is owned' do
      it 'should default to both owned as false' do
        @utility.both_owned.should be_false
      end
      
      it 'should have a rent value 4x the dice roll' do
        @utility.rent_due(@roll).should be(32)
      end
    end
    
    describe 'and both utilities are owned' do
      it 'should have a rent value 10x the dice roll' do
        @utility.both_owned = true
        @utility.rent_due(@roll).should be(80)
      end
    end
  end
end

describe Railroad do
  before :each do
    @rr = Railroad.new
    @rr.name = "Reading"
  end
  
  it 'should have a mortgage value of 100' do
    @rr.mortgage_value.should be(100)
  end
  
  describe 'when calculating the rent due' do
    describe 'and one railroad is owned' do      
      it 'should have a rent due of 25 dollars' do
        @rr.number_of_railroads_owned = 1
        @rr.rent_due.should be(25)
      end
    end
    
    describe 'and two railroads are owned' do
      it 'should have a rent due of 50 dollars' do
        @rr.number_of_railroads_owned = 2
        @rr.rent_due.should be(50)
      end
    end
    
    describe 'and three railroads are owned' do
      it 'should have a rent due of 100 dollars' do
        @rr.number_of_railroads_owned = 3
        @rr.rent_due.should be(100)
      end
    end
    
    describe 'and four railroads are owned' do
      it 'should have a rent due of 200 dollars' do
        @rr.number_of_railroads_owned = 4
        @rr.rent_due.should be(200)
      end
    end
  end
end

describe ColoredLot, 'the Boardwalk' do
  before :each do
    rent_values = List.of(Fixnum).new()
    [100, 200, 600, 1400, 1700, 2000].each { |val| rent_values.Add val }
    
    @boardwalk = ColoredLot.new
    @boardwalk.name = 'Boardwalk'
    @boardwalk.color = 'Blue'
    @boardwalk.base_rent = 50
    @boardwalk.rent_values_per_number_of_houses = rent_values
  end
  
  describe 'when calculating the rent due' do
    it 'should have a default rent of 50' do
      @boardwalk.rent_due.should be(50)
    end
    
    it 'should default to zero houses' do
      @boardwalk.number_of_houses.should be(0)
    end
    
    it 'should default to not owning all lots in the group' do
      @boardwalk.own_all_lots_in_group.should be_false
    end
    
    describe 'and all the lots of the same color are owned' do
      before :each do
        @boardwalk.own_all_lots_in_group = true
      end
      
      it 'should have a rent due of 100' do
        @boardwalk.rent_due.should be(100)
      end
      
      describe 'and we develop the lot' do
        it 'should have rent due of 200 with one house' do
          @boardwalk.number_of_houses = 1
          @boardwalk.rent_due.should be(200)
        end
        
        it 'should have rent due of 600 with two houses' do
          @boardwalk.number_of_houses = 2
          @boardwalk.rent_due.should be(600)
        end
        
        it 'should have rent due of 1400 with three houses' do 
          @boardwalk.number_of_houses = 3
          @boardwalk.rent_due.should be(1400)
        end
        
        it 'should have rent due of 1700 with four houses' do
          @boardwalk.number_of_houses = 4
          @boardwalk.rent_due.should be(1700)
        end
        
        it 'should have rent due of 2000 with a hotel' do
          @boardwalk.number_of_houses = 5
          @boardwalk.rent_due.should be(2000)
        end
      end
    end
  end
  
end