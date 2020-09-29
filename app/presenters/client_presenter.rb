class ClientPresenter
  def self.present(client)
    new(client).present
  end

  def initialize(client)
    @client = client
  end

  def present
    {
      id: id,
      name: name,
      address: address,
      city: city,
      state: state,
      division: division,
      major_group: major_group,
      industry_group: industry_group,
      sic: sic,
      description: description,
      policies: policies
    }
  end

  private

  attr_reader :client

  def id
    client&.id
  end

  def name
    client&.name
  end

  def recent_address
    @recent_address ||= client&.addresses&.most_recent
  end

  def address
    recent_address&.address_1
  end

  def city
    recent_address&.city
  end

  def state
    recent_address&.state
  end

  def division
    client&.division
  end

  def major_group
    client&.major_group
  end

  def industry_group
    client&.industry_group
  end

  def sic
    client&.sic
  end

  def description
    client&.description
  end

  def policies
    PoliciesPresenter.present_collection(client&.policies)
  end
end
