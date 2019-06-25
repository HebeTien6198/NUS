namespace :export do
    desc "Prints Country.all in a seeds.rb way."
    task :seeds_format => :environment do
    Country.order(:id).all.each do |country|
    bad_keys = ['created_at', 'updated_at', 'id']
    serialized = country.serializable_hash.
    delete_if{|key,value| bad_keys.include?(key)}
    puts "Country.create(#{serialized})"
    end
    end
   end