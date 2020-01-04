namespace :crawler do
  require 'wemarried_crawler'
  URL = 'https://www.wemarry.vn/kinh-nghiem-cuoi/dam-cuoi'

  task posts: :environment do
    puts '-----------start crawler--------------'
    url = URI.parse URL
    total_page = latest_page url
    puts "------total pages are #{total_page}--------"
    (1..total_page).each do |page|
      puts "___crawling page #{page}___"
      url.query = URI.encode_www_form([["page",page]])
      posts = get_news(url)
      posts.each do |post|
        img_link = post.delete :img_link
        p = Post.new post
        p.set_image img_link
        p.save
      end
    end
    puts '------------crawler success!-----------'
  end
end
