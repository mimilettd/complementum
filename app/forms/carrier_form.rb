class CarrierForm
  include ActiveModel::Model

  ATTRIBUTE_NAMES = [
    'Id',
    'Company Name',
    'Company Address 1',
    'Company Address 2',
    'Company City',
    'Company State',
    'Company Zip'
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
      address_attributes = attributes[:address]
      client_attributes = attributes.except(:address)
      Carrier.create!(client_attributes)
      Address.create!(address_attributes)
    end

    self
  end
end
