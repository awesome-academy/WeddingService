require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'date'

HOST = "https://www.wemarry.vn"

def latest_page url
  doc = Nokogiri::HTML(open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
  latest_page = doc.search(".paginate_marry ul.pagination li")[-3].content
  latest_page.to_i
end

def get_news url
  doc = Nokogiri::HTML(open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
  news = []
  doc.search('.list_item .item.clearfix').each do |item|
    title = ""
    description = ""
    img_link = HOST + item.search('.image a img.lazy').attribute('data-src')
    title = item.search('.info .title a').first.content.strip
    detail_link = HOST + item.search('.info .title a').attribute('href')
    description = item.search('.info .description').first.content.strip
    content = ""
    updated_at = ""
    c_doc = Nokogiri::HTML(open(detail_link, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
    c_doc.search(".detail_news").each do |c_item|
      content = c_item.search(".text").first
      date_text = c_item.search(".time_share.clearfix .time.pull-left span").first.content
      updated_at = DateTime.strptime(date_text, '%d/%m/%Y')
    end
    news.append({ title: title, description: description, content:content, img_link: img_link, image: nil , updated_at: updated_at })
  end
  news
end
