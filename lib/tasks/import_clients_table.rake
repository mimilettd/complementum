require 'csv'

namespace :db do
  desc 'Import clients table'
  task :import_clients_table, [:url] => [:environment] do |t, args|
    puts "Importing clients table..."
    CSV.open(args[:url], {headers: true}) do |csv|
      Importer::ClientsTable.new(csv).import
    end
    puts "Import successful."
  end
end
