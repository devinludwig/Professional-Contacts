require('rspec')
require('mailing_address')

describe('Mailing_address') do
  before() do
    Mailing_address.clear()
  end

  describe('#street') do
    it('returns the street address of the contact') do
      test_address = Mailing_address.new({:street => "3501 NE Simpson St.", :city => "Portland", :state => "Oregon", :zip => "97211", :type => "home"})
      expect(test_address.street()).to(eq("3501 NE Simpson St."))
    end
  end

  describe('#city') do
    it('returns the city of the contact') do
      test_address = Mailing_address.new({:street => "3501 NE Simpson St.", :city => "Portland", :state => "Oregon", :zip => "97211", :type => "home"})
      expect(test_address.city()).to(eq("Portland"))
    end
  end

  describe('#state') do
    it('returns the state of the contact') do
      test_address = Mailing_address.new({:street => "3501 NE Simpson St.", :city => "Portland", :state => "Oregon", :zip => "97211", :type => "home"})
      expect(test_address.state()).to(eq("Oregon"))
    end
  end

  describe('#zip') do
    it('returns the zip code of the contact') do
      test_address = Mailing_address.new({:street => "3501 NE Simpson St.", :city => "Portland", :state => "Oregon", :zip => "97211", :type => "home"})
      expect(test_address.zip()).to(eq("97211"))
    end
  end

  describe('#type') do
    it('returns the type of the contact') do
      test_address = Mailing_address.new({:street => "3501 NE Simpson St.", :city => "Portland", :state => "Oregon", :zip => "97211", :type => "home"})
      expect(test_address.type()).to(eq("home"))
    end
  end
end
