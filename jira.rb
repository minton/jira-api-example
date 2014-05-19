require 'json'
require 'rest-client'
require 'mustache'
require 'curb'

begin
  # TODO - You'll need to point this URL at your JIRA server
  c = Curl::Easy.new("https://jira.example.com/rest/api/2/search?jql=fixVersion=9.32.18")
  c.http_auth_types = :basic
  c.username = 'jira'
  c.password = ENV['JIRA_API_PASSWORD']
  c.headers["Accept"] = "application/json"
  c.perform
  issues_raw_json = c.body_str
  issues_json = JSON.parse(issues_raw_json)
  puts issues_json
rescue
  puts "Unable to connect to JIRA!"
  raise
end
