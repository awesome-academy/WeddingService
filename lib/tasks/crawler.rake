namespace :crawler do
  require 'wemarried_crawler'

  task news: :environment do
    puts '-----------start crawler--------------'
    url = URI.parse'https://www.wemarry.vn/kinh-nghiem-cuoi/dam-cuoi'
    total_page = latest_page url
    puts "------total pages are #{total_page}--------"
    (1..total_page).each do |page|
      puts "___crawling page #{page}___"
      url.query = URI.encode_www_form([["page",page]])
      puts url
      news = get_news(url)
      news.each do |new|
        New.create new
      end
    end
    puts '------------crawler success!-----------'
  end
end
