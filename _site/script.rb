require 'yaml'
require 'haml'
require 'debugger'

def gsub_links(thing, quote)
  if thing
    links = thing.scan /href=\d+/

    links.each do |link|
      num = link.match(/\d+/)[0].to_i
      if quote['hrefs']
        href = quote['hrefs'][num]
        thing.gsub! "href=#{num}", "href='#{href}' target='_blank'"
      else
        puts "no hrefs for quote #{quote['quote']}"
      end

    end

    thing
  else
    puts "no explanation for quote #{quote['quote']} bro"
  end
end


yml = YAML.load_file('./episodes.yaml')
templ = File.read('templ.haml')
episodes = yml['episodes']

html = Haml::Engine.new(templ).render(Object.new, {episodes:episodes})
e = episodes[0]
q = e['quotes'][0]
File.open('./_posts/2012-10-14-dbz-abridged-joke-explanations.html', 'w') { |file| file.write(html) }
