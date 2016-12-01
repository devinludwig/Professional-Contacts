require('rspec')
require('contact')

describe('Contact') do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('returns the first_name of the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      expect(test_contact.first_name()).to(eq("Devin"))
    end
  end

  describe('#last_name') do
    it('returns the last_name of the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      expect(test_contact.last_name()).to(eq("Ludwig"))
    end
  end

  describe('#company') do
    it('returns the company of the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      expect(test_contact.company()).to(eq("Epicodus"))
    end
  end

  describe('#job_title') do
    it('returns the job_title of the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      expect(test_contact.job_title()).to(eq("CTO"))
    end
  end

  describe('#id') do
    it('returns the id of the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('#save_address') do
    it('saves an address to the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      address = Mailing_address.new({:street => "3501 NE Simpson St.", :city => "Portland", :state => "Oregon", :zip => "97211", :type => "home"})
      test_contact.save_address(address)
      expect(test_contact.addresses()).to(eq([address]))
    end
  end


  describe('#addresses') do
    it('returns the addresses of the contact') do
      test_contact = Contact.new({:first_name => "Devin", :last_name => "Ludwig", :company => "Epicodus", :job_title => "CTO"})
      expect(test_contact.addresses()).to(eq([]))
    end
  end


end
