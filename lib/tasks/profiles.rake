namespace :refinery do
  
  namespace :profiles do
    
    # call this task my running: rake refinery:profiles:my_task
    desc "Import profile data from previous site"
    task :reset => :environment do
      Profile.destroy_all
      ProfileDepartment.destroy_all
      ProfileEmail.destroy_all
      ProfileOrganization.destroy_all
      ProfilePhone.destroy_all
      ProfileTitle.destroy_all
      ProfileUrl.destroy_all
    end
    
    
    # call this task my running: rake refinery:profiles:my_task
    desc "Import profile data from previous site"
    task :import => :environment do
      html = Nokogiri::HTML(open("http://iem.ucsd.edu/people/profiles"))

      pages = html.css(".pagination a")[-2].content.to_i

      profile_links = []

      html.css("td.name a").each {|link| profile_links << link[:href]}

      (2..pages).each do |n|
        html = Nokogiri::HTML(open("http://iem.ucsd.edu/people/profiles?page=#{n}"))
        html.css("td.name a").each {|link| profile_links << link[:href]}
      end
      
      profile_links.each do |uri|
        html = Nokogiri::HTML(open("http://iem.ucsd.edu#{uri}"))
        profile = {}
        profile[:name] = html.css("#content div h2").children[0].content
        
        profile[:titles] = []
        titles = html.css("#content div .title").children
        
        (1..titles.count).each do |n|
          profile[:titles] << ([titles[n-1].content.strip.titleize, titles[n].content.strip.titleize, titles[n][:href]]) if n % 2 == 1
        end
        
        puts profile[:titles]
        
        profile[:email] = html.css("#content div .email").children[0].content if html.css("#content div .email").children[0]
        profile[:phone] = html.css("#content div .phone").children[0].content if html.css("#content div .phone").children[0]
        profile[:fax] = html.css("#content div .fax").children[0].content if html.css("#content div .fax").children[0]
        profile[:url] = html.css("#content div .url").children[0].content if html.css("#content div .url").children[0]
        profile[:bio] = html.css("#bio").children[3..-2].to_html if html.css("#bio").children[3..-2]
        
        profile[:photo] = {:url => html.css("#profile img").first[:src]} if html.css("#profile img").first
        
        create_profile(profile)
      end
    end

    def create_profile(p)
      
      profile = Profile.create!(:first_name => p[:name].split(' ').first, :last_name => p[:name].split(' ')[1..-1].join(" "), :bio => p[:bio])
      profile.emails.create!(:content => p[:email], :label => "Default")
      
      if p[:phone]
        phone = p[:phone].split('x')[0].scan(/\d+/).join
        phone = (phone + 'x' + p[:phone].split('x')[1].scan(/\d+/).join) if p[:phone].split('x')[1]
        pp = ProfilePhone.find_by_number(phone) || ProfilePhone.create!(:number => phone, :label => 'Default')
        profile.phones << pp
      end
      
      if p[:fax]
        fax = p[:fax].split('x')[0].scan(/\d+/).join
        fax = (phone + 'x' + p[:fax].split('x')[1].scan(/\d+/).join) if p[:fax].split('x')[1]
        pf = ProfilePhone.find_by_number(fax) || ProfilePhone.create!(:number => fax, :label => 'fax')
        profile.phones << pf
      end
      
      if p[:url]
        pu = ProfileUrl.find_by_content(p[:url]) || ProfileUrl.create!(:content => p[:url], :label => "Homepage")
        profile.urls << pu
      end
      
      p[:titles].each do |title|
        puts title
        po = ProfileOrganization.find_by_name("UC San Diego") || ProfileOrganization.create!(:name => "UC San Diego")
        
        pd = ProfileDepartment.find_by_name(title[1]) || ProfileDepartment.create!(:name => title[1])
        pd.organizations << po
        
        pu = ProfileUrl.find_by_content(title[2]) || ProfileUrl.create!(:content => title[2], :label => "Homepage") if title[2] != ''
        profile.urls << pu if pu
        
        pt = ProfileTitle.find_by_name(title[0]) || ProfileTitle.create!(:name => title[0])
        
        profile.affiliations.create!(:organization => po, :department => pd, :title => pt)
      end
      
      # photo
      if p[:photo] && p[:photo][:url]
        tmp_dir = build_cache_dir
        url = 'http://iem.ucsd.edu' + p[:photo][:url].split('/')[0..-2].join('/') + '/'
        filename = p[:photo][:url].split('/')[-1].split('?')[0].gsub(' ',"%20")
        
        image = open("#{tmp_dir}/#{filename}", "wb")
        puts "downloading #{url + filename}"
        image.write(open(url + filename).read)
        `/usr/local/bin/mogrify -format jpg #{tmp_dir}/#{}*.bmp` if filename.split('.')[-1] == 'bmp'
        image.close
        
        
        profile.photo = Image.create!(:image => open("#{tmp_dir}/#{filename.gsub('.bmp','.jpg')}",'r'))
        File.delete(image)
      end
      
      profile.save
      puts profile
    
    rescue ActiveRecord::RecordInvalid => e
      puts "AR Invalid"
    end

    def build_cache_dir
      Dir.mkdir "#{Rails.root}/tmp/refinerycms-profiles" unless Dir.entries("#{Rails.root}/tmp").include?("refinerycms-profiles")
      "#{Rails.root}/tmp/refinerycms-profiles"
    end
    
  end
end