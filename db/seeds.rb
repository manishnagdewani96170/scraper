# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

response = RestClient.get 'https://www.kimonolabs.com/apis/dg4czh3u?apikey=Oz5Vzw3wgBJaxqY68kRuqOoxA3U2vipJ'
puts response

# doc = Pismo::Document.new('http://www.bbc.com/')
# puts doc.keywords

#stats_url = 'http://www.androidauthority.com'
# stats_url = 'http://www.spoilertv.com/'
# browser = Mechanize.new {|agent| agent.user_agent_alias = 'Linux Firefox'}
# response = browser.get(stats_url)
# loop_class = response.search("div[@class='article-title']").first(5)
# loop_class.each do |add|
# 	link_add = add.content
# 	puts link_add
# end
# # puts loop_add
# loop_class = response.search("div[@class='article-image-wrapper']").search('img').first(5)
# loop_class.each do |add|
# 	link_add = add['src']
# 	puts link_add
# end

# loop_class = response.search("a[@class='loop-link']").first(5)
# loop_class.each do |add|
# 	link_add = add['href']
# 	puts link_add
# end
############################ -------------Nokogiri --------------------#########################
# url = 'http://www.spoilertv.com/'
# doc = Nokogiri::HTML(open(url))
# #text =~ /title/
# doc.xpath("//h3[contains(@class,'title')]").first(5).each do |node| 
# 	link_add = node.text.strip
# 	puts link_add
# end

# doc.xpath("//div[contains(@class,'img')]").search('img').first(5).each do |node| 
# 	link_add = node['src']
# 	puts link_add
# end

# doc.xpath("//div[contains(@class,'img')]").search('a').first(5).each do |node| 
# 	link_add = node['href']
# 	puts link_add
# end

###################Scraper for wordpress sites#############################
# url = 'http://www.androidauthority.com'
# doc = Nokogiri::HTML(open(url))
# #text =~ /title/
# article_title = doc.xpath("//h3[contains(@class,'title')]").first(5)
# article_title = article_title.empty? ? article_title : doc.xpath("//h2[contains(@class,'title')]").first(5)
# article_title.each do |node| 
# 	link_add = node.text.strip
# 	puts link_add
# end

# image = doc.xpath("//div[contains(@class,'img')]").search('img').first(5)
# image = image.empty? ? image : doc.xpath("//div[contains(@class,'image')]").search('img').first(5)
# image.each do |node| 
# 	link_add = node['src']
# 	puts link_add
# end

# link_add = doc.xpath("//div[contains(@class,'img')]").search('a').first(5)
# link_add = link_add.empty? ? link_add : doc.xpath("//div[contains(@class,'image')]")
# puts link_add
###################Scraper for wordpress sites#############################

# link_add.each do |node| 
# 	link_add = node['href']
# 	puts link_add
# end

# loop_class = doc.css(".article-image-wrapper").search('img').first(5).each do |add|
#   link_add = add['src']
#    puts link_add

# end	
# loop_class = doc.css(".loop-link").first(5).each do |add|
#   link_add = add['href']
#    puts link_add

# end	