class Mailing_address
  attr_reader(:street, :city, :state, :zip, :type, :id)
  @@addresses = []

  def initialize(attributes)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
    @id = @@addresses.length() + 1
  end

  def save
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end
end
