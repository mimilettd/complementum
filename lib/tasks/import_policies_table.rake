require 'csv'

namespace :db do
  desc 'Import policies table'
  task :import_policies_table, [:url] => [:environment] do |t, args|
    puts "Importing policies table..."
    CSV.open(args[:url], {headers: true}) do |csv|
      Importer::PoliciesTable.new(csv).import
    end
    puts "Import successful."
  end
end
