class PoliciesPresenter
  def self.present_collection(policies)
    new(policies).present_collection
  end

  def initialize(policies)
    @policies = policies
  end

  def present_collection
    policies.map do |policy|
      PolicyPresenter.present(policy)
    end
  end

  private

  attr_reader :policies
end
