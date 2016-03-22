namespace :scraper do
  desc "TODO"
  task fetch_prooduct: :environment do
  	url = 'http://www.amazon.com/gp/product/B00HM9OI5A/ref=s9_cartx_gw_d2_g121_i4?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=desktop-2&pf_rd_r=0B3RTG28JFA03G9WQ5WX&pf_rd_t=36701&pf_rd_p=2091268722&pf_rd_i=desktop'
    doc = Nokogiri::HTML(open(url))
    product = doc.css("#acrCustomerReviewLink").search('a').text.strip
    puts product
    byebug
    bring_out_your_dead = Loofah::Scrubber.new do |node|
	  if node.name == "style" 
	    node.remove
	  end
	end
    link = doc.css('#SalesRank').text
    doc = Loofah.scrub_xml_fragment(link, bring_out_your_dead)
	puts doc
  end

end
  