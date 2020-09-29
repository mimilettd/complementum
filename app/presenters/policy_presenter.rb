class PolicyPresenter
  def self.present(policy)
    new(policy).present
  end

  def initialize(policy)
    @policy = policy
  end

  def present
    {
      id: id,
      carrier: carrier,
      category: category,
      division: division,
      effective_date: effective_date,
      expiration_date: expiration_date,
      written_premium: written_premium,
      carrier_policy_number: carrier_policy_number
    }
  end

  private

  attr_reader :policy

  def id
    policy&.id
  end

  def carrier
    CarrierPresenter.present(policy&.carrier)
  end

  def category
    policy&.category
  end

  def division
    policy&.division
  end

  def effective_date
    policy&.effective_date
  end

  def expiration_date
    policy&.expiration_date
  end

  def written_premium
    policy&.written_premium
  end

  def carrier_policy_number
    policy&.carrier_policy_number
  end
end
