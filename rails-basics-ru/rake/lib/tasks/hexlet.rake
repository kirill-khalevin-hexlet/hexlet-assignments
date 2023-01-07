require 'csv'

namespace :hexlet do
  desc 'import users from CSV'
  task :import_users, [:file_path] => :environment do |_task, args|
    CSV.parse(File.read(args[:file_path]), headers: true) do |row|
      User.create(
        first_name: row[0],
        last_name: row[1],
        birthday: Date.strptime(row[2], '%m/%d/%Y'),
        email: row[3]
      )
    end
  end
end
