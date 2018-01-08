namespace :import do
  desc "Import data from ContentDM export"
  task contentdm: :environment do |_task, args|
    import_data
  end

  # helpers
  #
  def import_data
    ContentdmImporter.import
    puts "Import complete"
  end
end
