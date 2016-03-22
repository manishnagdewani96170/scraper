require 'mechanize'

class Scraper
  
  
  def mechanize
    @mechanize ||= Mechanize.new do |m|
      m.user_agent_alias = 'Linux Firefox'
    end 
  end


  def base_url
    'http://www.superiore.de/'
  end

  def scrape_first_part
    page = mechanize.get "#{base_url}"
    data = page.search('#page #left .box div.suckerdiv ul#tree').map{ |l|
      link_node = l.search('li a')
      link = (Mechanize::Page::Link.new(link_node, mechanize, page)).click
      job = link.search('table').map{ |t|
        scrape_page(t)

      }
      link_node = page.search('div.locator table tbody tr td a img').first

      if link_node.present?
        link = Mechanize::Page::Link.new(link_node, mechanize, page)
        data += scrape_page(link.click)
      end
      data
    }

   
  end

  def scrape_page(r)
    job_url = r.search('.clearfix h3 a').first['href']
    page = mechanize.get job_url
    new_job = {
        product_name: page.title[/(.*)Job in/, 1].strip.try(:strip),
        producer: page.at('//*[@itemprop=datePosted]').empty? ? page.search('#vacPlacedBy .toprow').children.last.try(:text).try(:to_date) : page.at('//*[@itemprop=datePosted]').try(:text).try(:strip).try(:to_date),
        address:  page.search('.dscrpn').try(:text).try(:strip) ,
        description: page.search('dd.vacLocation').try(:text).try(:strip),
        
        rating_gambero_rosso_2016: page.search("meta[name='description']")[0].attributes["content"].value[/Salary: (.*), Job Type/, 1],
        rating_duemilavini_2016:
        rating_vitae_2016: page.search("meta[name='description']")[0].attributes["content"].value[/Salary: (.*), Job Type/, 1],
        rating_veronelli_guide:
        rating_luca_maroni_2016:
        rating_robert_parker:

        rebsorte:
        anbau:
        ansbau:
        filtration:
        alkoholgehalt:
        verschluss:
        trinktemperatur:
        lagerpotenzial:
        price:
        volume:
        availability:
    }
    new_job
  end
   
end
