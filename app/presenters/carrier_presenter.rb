class CarrierPresenter
  def self.present(carrier)
    new(carrier).present
  end

  def initialize(carrier)
    @carrier = carrier
  end

  def present
    {
      id: id,
      name: name,
      address_1: address_1,
      address_2: address_2,
      city: city,
      state: state,
      zip: zip
    }
  end

  private

  attr_reader :carrier

  def id
    carrier&.id
  end

  def name
    carrier&.name
  end

  def recent_address
    @recent_address ||= carrier&.addresses&.most_recent
  end

  def address_1
    recent_address&.address_1
  end

  def address_2
    recent_address&.address_2
  end

  def city
    recent_address&.city
  end

  def state
    recent_address&.state
  end

  def zip
    recent_address&.zip
  end
end
