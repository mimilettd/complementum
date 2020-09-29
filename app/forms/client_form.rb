class ClientForm
  include ActiveModel::Model

  ATTRIBUTE_NAMES = [
    :name,
    :address,
    :city,
    :state,
    :divison,
    :major_group,
    :industry_group,
    :sic,
    :description
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
      Client.create!(attributes)
    end

    self
  end
end
