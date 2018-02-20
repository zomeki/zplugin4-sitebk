namespace ZomekiCMS::NAME do
  namespace :db do
    namespace :site do
      task :load do
        require "zomekip/sitebk/loader"
        require "zomekip/sitebk/scanner"
        require "zomekip/sitebk/backupper"
      end

      desc 'Dump site (SITE_ID=int, DIR=path)'
      task dump: [:environment, :load] do
        unless ENV['SITE_ID']
          puts "Specify SITE_ID."
          next
        end

        site = Cms::Site.where(id: ENV['SITE_ID']).first_or_initialize

        puts "dumping site id: #{site.id}..."
        save_dir = ENV['DIR'] || ENV['HOME'] || Rails.root
        Zomekip::Sitebk::Backupper.new(site, dir: save_dir).dump do |model, ids, path|
          puts "#{model.table_name}: #{ids.size} rows to '#{path}'"
        end
        puts "done."
      end

      desc 'Dump all sites (DIR=path)'
      task dump_all: [:environment, :load] do
        Cms::Site.order(:id).each do |site|
          ENV['SITE_ID'] = site.id.to_s
          Rake::Task["zomeki:db:site:dump"].reenable
          Rake::Task["zomeki:db:site:dump"].invoke
        end
      end

      desc 'Restore site (SITE_ID=int, DIR=path)'
      task restore: [:environment, :load] do
        site = Cms::Site.new(id: ENV['SITE_ID'])

        puts "restoring site id: #{site.id}..."
        save_dir = ENV['DIR'] || ENV['HOME'] || Rails.root
        Zomekip::Sitebk::Backupper.new(site, dir: save_dir).restore do |model, ids, path|
          puts "#{model.table_name}: #{ids.size} rows from '#{path}'"
        end
        puts "done."
      end
    end
  end
end
