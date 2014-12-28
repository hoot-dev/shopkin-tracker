# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'open-uri'
require 'json'
require 'nokogiri'

BASE_URL = 'http://myshopkinslist.shopkinsworld.com'

USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36'

$shopkins = []

# ids from 2303 to 2452 are series 1
# ids from 2453 to 2596 are series 2

# Team Name, Stats, & Slug
def get_shopkins
  (2303..2596).each do |id|
    url = "#{BASE_URL}/product-modal?id=#{id}"
    doc = Nokogiri::HTML(open(url, 'User-Agent' => USER_AGENT))

    name = get_name(doc)
    number = get_number(doc)
    categories = get_categories(doc)
    image = "#{BASE_URL}#{get_image(doc)}"

    $shopkins << {
      name: name,
      number: number,
      series: categories[0],
      team: categories[1],
      finish: categories[2],
      rarity: categories[3],
      image: image
    }
  end
end

def get_name(doc)
  doc.css('h1.modal__trashie_name').text
end

def get_number(doc)
  doc.css('h2.modal__trashie_number').text
end

def get_categories(doc)
  doc.css('div.modal__trashie_categories span.detail').map { |category| category.text }
end

def get_image(doc)
  doc.css('div.modal__trashie_image img').map { |img| img['src'] }[0]
end

get_shopkins

$shopkins.each do |shopkin|
  Shopkin.create(shopkin)
end
