
require 'rspec'
require 'pry'
require 'contact'

describe('Contact') do
  before() do
    Contact.clear
  end
  describe('#initialize') do
    it('create a new contact') do
      person1 = Contact.new({:first_name=> 'Teal', :last_name=> 'Hydro', :job=> 'Hydrator', :company=> "Flask", :contact_type=> 'Work'})
      expect(person1.first_name()).to(eq("Teal"))
      expect(person1.last_name()).to(eq("Hydro"))
      expect(person1.job()).to(eq("Hydrator"))
      expect(person1.company()).to(eq("Flask"))
      expect(person1.contact_type()).to(eq("Work"))
    end
  end

  describe('.all') do
    it('dislay empty array') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('add object to address_book') do
      person = Contact.new({:first_name=> 'Teal', :last_name=> 'Hydro', :job=> 'Hydrator', :company=> "Flask", :contact_type=> 'Work'})
      person.save
      # binding.pry
      expect(Contact.all()).to(eq([person]))
      expect(Contact.all[0].first_name).to(eq("Teal"))
      expect(Contact.all[0].company).to(eq("Flask"))
    end
  end

  describe('#save') do
    it('add object to address_book') do
      person1 = Contact.new({:first_name=> 'Bottle', :last_name=> 'Hydro', :job=> 'Hydrator', :company=> "Flask", :contact_type=> 'Work'})
      person1.save
      person2 = Contact.new({:first_name=> 'Cup', :last_name=> 'Hydro', :job=> 'Hydrator', :company=> "Flask", :contact_type=> 'Work'})
      person2.save
      # binding.pry
      expect(Contact.all()).to(eq([person1, person2]))
      expect(Contact.all[0].id).to(eq(0))
      expect(Contact.all[1].id).to(eq(1))
    end
  end

  describe('.find') do
    it('finds a contact in the address book based on id') do
      person1 = Contact.new({:first_name=> 'Bottle', :last_name=> 'Hydro', :job=> 'Hydrator', :company=> "Flask", :contact_type=> 'Work'})
      person1.save
      person2 = Contact.new({:first_name=> 'Cup', :last_name=> 'Hydro', :job=> 'Hydrator', :company=> "Flask", :contact_type=> 'Work'})
      person2.save
      expect(Contact.find(0)).to(eq(person1))
    end
  end

end
