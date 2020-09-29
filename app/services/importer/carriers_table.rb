require 'csv'

class Importer::CarriersTable
  ImportError = Class.new(StandardError)

  attr_reader :csv

  def self.import(csv)
    new(csv).import
  end

  def initialize(csv)
    @csv = csv
  end

  def import
    csv.each_with_index do |row, row_index|
      validate_headers!(csv.headers)
      create_client!(row, row_index)
    end
  end

  private

  def validate_headers!(headers)
    attribute_names = CarrierForm.attribute_names
    non_existent_attribute_names = headers - attribute_names

    if non_existent_attribute_names.any?
      raise ImportError.new(
        "One or more headers do not refer to columns in " +
        "clients: #{non_existent_attribute_names.join(', ')}"
      )
    end
  end

  def create_client!(row, row_index)
    form = CarrierForm.new(
      id: parse(row.fetch('Id')),
      name: row.fetch('Company Name'),
      address: {
        address_1: row.fetch('Company Address 1'),
        address_2: row.fetch('Company Address 2'),
        city: row.fetch('Company City'),
        state: row.fetch('Company State'),
        zip: row.fetch('Company Zip'),
        userable_type: 'Carrier',
        userable_id: parse(row.fetch('Id'))
      }
    )
    form.save!

    if form.errors.any?
      raise ImportError.new(
        "One or more values on row ##{row_index + 1} are invalid:\n\n" +
        list_of_validation_errors_for(form)
      )
    end
  end

  def list_of_validation_errors_for(form)
    lines = form.errors.keys.map do |attribute|
      "* #{attribute}: #{form.errors[attribute].join(', ')}"
    end

    lines.join("\n")
  end

  def parse(row)
    row.present? ? JSON.parse(row) : row
  end
end
