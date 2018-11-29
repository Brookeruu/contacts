require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  @address_book = Contact.all
  erb(:input)
end

post('/output') do
  @first_name = params.fetch("first_name")
  @last_name = params.fetch("last_name")
  @job = params.fetch("job")
  @company = params.fetch("company")
  @contact_type = params.fetch("contact_type")
  contact = Contact.new({:first_name=> @first_name, :last_name=> @last_name, :job=> @job, :company=> @company, :contact_type=> @contact_type})
  contact.save
  @id = contact.id
  @address_book = Contact.all
  erb(:input)
end

get('/output/:id') do
  @display = "display:none"
  @id = params[:id].to_i
  contact = Contact.find(@id)
  @first_name = contact.first_name
  @last_name = contact.last_name
  @job = contact.job
  @company = contact.company
  @contact_type = contact.contact_type
  @address_book = Contact.all
  @address = Address.all
  erb(:output)
end

get('/address/:id') do
  @id = params[:id].to_i
  contact = Contact.find(@id)
  @first_name = contact.first_name
  @last_name = contact.last_name
  @job = contact.job
  @company = contact.company
  @contact_type = contact.contact_type
  @display = "display:block"
  @address = Address.all
  erb(:output)
end

get('/address_update/:id') do
  @id = params[:id].to_i
  contact = Contact.find(@id)
  @first_name = contact.first_name
  @last_name = contact.last_name
  @job = contact.job
  @company = contact.company
  @contact_type = contact.contact_type
  @display = "display:block"
  @street = params.fetch("street")
  @city = params.fetch("city")
  @state = params.fetch("state")
  @zip = params.fetch("zip")
  @address_type = params["address_type"]
  address = Address.new({:street=> @street, :state=> @state, :city=> @city, :zip=> @zip, :address_type=> @address_type, :id => @id})
  address.save
  @address = Address.all
  erb(:output)
end
