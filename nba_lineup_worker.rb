require 'json'
require 'httparty'

# API_BASE_URI = 'http://localhost:9292'
API_BASE_URI = 'http://nba-dynamo.herokuapp.com'
API_VER = '/api/v1/'

def api_url(resource)
  URI.join(API_BASE_URI, API_VER, resource).to_s
end

puts "Worker started"
puts "My task_id is #{@iron_task_id}"
puts "Parameters: '#{params}'"

saved_nbaplayer = HTTParty.get api_url("nbaupdater")
saved_nbaplayer.each do |player|
  nba_url = api_url("nbaupdater/#{player['id']}")
  results = HTTParty.get nba_url
  puts "Updated: #{player['id']}"
end