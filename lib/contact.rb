class Contact
  attr_reader(:first_name, :company, :last_name, :job_title, :id, :addresses, :phone_numbers)
  @@contacts = []

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @company = attributes.fetch(:company)
    @job_title = attributes.fetch(:job_title)
    @id = @@contacts.length() + 1
    @addresses = []
    @phone_numbers = []
  end

  def save
    @@contacts.push(self)
  end

  def save_address(address)
    @addresses.push(address)
  end

  def save_phone_number(number)
    @phone_numbers.push(number)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

end
