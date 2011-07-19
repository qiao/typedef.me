namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    20.times do |n| 
      Post.create!(:title     => Faker::Lorem.words.join(' '),
                   :content   => Faker::Lorem.paragraphs(5).join,
                   :published => true,
                   :slug      => Faker::Lorem.words(2).join)
    end

    5.times do |n|
      Page.create!(:title     => Faker::Lorem.words.join(' '),
                   :content   => Faker::Lorem.paragraphs(5).join,
                   :published => true,
                   :slug      => Faker::Lorem.words(2).join)
    end

    100.times do |n|
      comment = Commentable.find(rand(25) + 1).comments.new
      comment.update_attributes(:author_name  => Faker::Name.name,
                                :author_email => Faker::Internet.email,
                                :author_url   => Faker::Internet.domain_name,
                                :content      => Faker::Lorem.paragraph)
    end
  end
end
