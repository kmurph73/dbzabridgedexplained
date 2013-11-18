require 'yaml'
require 'debugger'
yml = YAML.load_file('./episodes.yaml')
html = "<h1>DBZ Abridged Joke Explanation / Voice Clarification</h1>"

yml['episodes'].each do |episode|
  html += "<h3>#{episode['title']}</h3>"
  episode['quotes'].each do |quote|
    html += ""
  end
end
