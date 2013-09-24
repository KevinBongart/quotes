class Movie < ActiveRecord::Base
  require 'open-uri'

  after_create :scrap
  has_many :quotes, dependent: :destroy

  def scrap
    page = Nokogiri::HTML(open url)

    title = page.css('#titles h2').first.text.gsub(' - ', '')
    self.update_attributes(title: title)

    page.css('div.citation div.corps a').each do |quote|
      quotes << Quote.create(text: quote.text)
    end
  end
end
