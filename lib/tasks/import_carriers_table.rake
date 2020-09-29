require 'csv'

namespace :db do
  desc 'Import carriers table'
  task :import_carriers_table, [:url] => [:environment] do |t, args|
    puts "Importing carriers table..."
    CSV.open(args[:url], {headers: true}) do |csv|
      Importer::CarriersTable.new(csv).import
    end
    puts "Import successful."
  end
end
