class Contact
  @@address_book = []
  @@id_index = 0

  attr_accessor :first_name, :last_name, :job, :company, :contact_type, :id

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
    @id = @@id_index

  end

  def self.all
    @@address_book
  end

  def save
    @@address_book.push(self)
    @@id_index +=1
  end

  def self.clear
    @@address_book = []
    @@id_index = 0
  end

  def self.find(id)
    contacts = Contact.all
    contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

end
