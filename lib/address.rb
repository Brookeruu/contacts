require('./lib/contact')

class Address < Contact
  @@addresses = []

  attr_accessor :street, :city, :state, :zip, :address_type
  attr_reader :id

  def initialize(attributes)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @address_type = attributes.fetch(:address_type)
    @id = attributes.fetch(:id)
  end

  def save()
    @@addresses.push(self)
  end

  def self.all
    @@addresses    
  end


end
