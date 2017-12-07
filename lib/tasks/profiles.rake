# coding: utf-8
# This task is to be run locally
# It will take a local csv file and import it to a db on Heroku
# $ cat lib/tasks/your-csv-file.csv | heroku run rake profiles:import
# It's probably buggy but I include it to have it
# The CSV assumes the following structure
# name, city, country, email, facebook link, website, video link, year of birth
# the rest will be ignored

namespace :profiles do
  desc "import profiles from files to database"
  task :import, [:param] => :environment do |t, args|

    failed = 0
    success = 0
    total = 0

    if args[:param]
      file = File.open(args[:param])
    else
      file = STDIN
    end

    file.each do |line|
      total += 1
      attrs = line.split(",")
      if attrs[3] && !attrs[3].blank?

        u = User.find_by(email: attrs[3].downcase)

        if u == nil
          u = User.new()
          u.name = attrs[0]
          puts "processing #{attrs[0]}"
          u.city = attrs[1]
          if attrs[2] == 'Deutschland'
            u.country = 'de'
          elsif attrs[2] == 'Österreich'
            u.country = 'at'
          elsif attrs[2] == 'Schweiz'
            u.country = 'ch'
          end

          u.password = (0...16).map { ('a'..'z').to_a[rand(26)] }.join

          u.email = attrs[3]

          u.year_of_birth = 1900
          if attrs[7]
            u.year_of_birth = attrs[7].to_i
          end

          if attrs[5]
            u.website = attrs[5]
          end

          if attrs[4]
            u.facebook_link = attrs[4]
          end

          u.public = false
          u.admin = false
          if attrs[6].empty?
            u.video_link = 'https://www.youtube.com/'
          elsif
            u.video_link = attrs[6]
          end

          u.is_available_on = ["6"]
          u.will_travel = 'keine'

          u.save!
          success += 1

          UserMailer.account_added(u).deliver_now
        else
          failed += 1
          puts "\n#{attrs[0]} already exists\n"
        end
      else
        failed += 1
        puts "\nno email in record\n"
      end
    end
    puts "\ndone, total #{total}, failed #{failed}, success #{success}"
  end
end
