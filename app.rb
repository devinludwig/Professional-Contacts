require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/phone')
require('./lib/mailing_address')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/new_contact') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  company = params.fetch('company')
  job_title = params.fetch('job_title')
  contact = Contact.new({:first_name => first_name, :last_name => last_name, :company => company, :job_title => job_title})
  contact.save()
  erb(:success)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end

get('/contact/:id/mailing_address') do
  @contact = Contact.find(params.fetch('id').to_i)
  @contact_id = params.fetch('id').to_i
  erb(:address_form)
end

post('/new_address') do
  @street = params.fetch('street')
  @city = params.fetch('city')
  @state = params.fetch('state')
  @zip = params.fetch('zip')
  @type = params.fetch('type')
  @contact_id = params.fetch('contact_id').to_i()
  address =Mailing_address.new({:street => @street, :city => @city, :state => @state, :zip => @zip, :type => @type})
  @contact = Contact.find(@contact_id)
  @contact.save_address(address)
  erb(:success)
end

get('/contact/:id/phone_number') do
  @contact = Contact.find(params.fetch('id').to_i)
  @contact_id = params.fetch('id').to_i
  erb(:phone_form)
end

post('/new_phone') do
  @area_code = params.fetch('area_code')
  @number = params.fetch('number')
  @type = params.fetch('type')
  @contact_id = params.fetch('contact_id').to_i()
  number = Phone.new({:area_code => @area_code, :number => @number, :type => @type})
  @contact = Contact.find(@contact_id)
  @contact.save_phone_number(number)
  erb(:success)
end
