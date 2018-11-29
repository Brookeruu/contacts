require 'rspec'
require 'pry'
require 'address'

describe('Address') do
  describe('#initialize') do
    it('create new address') do
      address = Address.new({:street=> '400 SW Road', :city => 'Portland', :state=> 'OR', :zip=> '97205', :address_type=> 'Work', :id=> 5})
      expect(address.street).to(eq("400 SW Road"))
    end
  end
end
