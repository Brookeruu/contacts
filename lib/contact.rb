class Contact
  @@address_book = []

  attr_accessor :first_name, :last_name, :job, :company, :contact_type

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)

  end


end
