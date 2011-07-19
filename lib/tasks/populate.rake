namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    20.times do |n| 
      Post.create!(:title     => Faker::Lorem.words.join(' '),
                   :content   => Faker::Lorem.paragraphs(5),
                   :published => true,
                   :slug      => Faker::Lorem.words(2).join)
    end

    5.times do |n|
      Page.create!(:title     => Faker::Lorem.words.join(' '),
                   :content   => Faker::Lorem.paragraphs(5),
                   :published => true,
                   :slug      => Faker::Lorem.words(2).join)
    end
  end
end
