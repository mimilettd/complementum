class PolicyForm
  include ActiveModel::Model

  ATTRIBUTE_NAMES = [
    'Id',
    'Type',
    'Division',
    'CarrierId',
    'ClientId',
    'EffectiveDate',
    'ExpirationDate',
    'WrittenPremium',
    'CarrierPolicyNumber'
  ]

  attr_reader :attributes

  def self.attribute_names
    ATTRIBUTE_NAMES
  end

  def initialize(attributes = {})
    @attributes = attributes
  end

  ATTRIBUTE_NAMES.each do |attribute_name|
    define_method(attribute_name) do
      attributes[attribute_name]
    end

    define_method("#{attribute_name}=") do |value|
      attributes[attribute_name] = value
    end
  end

  def save!
    if valid?
      Policy.create!(attributes)
    end

    self
  end
end
