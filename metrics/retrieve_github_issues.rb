# encoding: UTF-8

require 'rubygems'
require 'httparty'
require 'pp'
require 'json'

##
# GitHub issue downloader
# 
# Downloads the issues posted for a given project and writes the responses to a JSON file.
# Example dataset produced by this script can be obtained from https://dl.dropboxusercontent.com/u/710158/issues.json.zip
#
# Requirements:
#  * Ruby
#  * rubygems
#  * httparty
#
# Usage: 
#   * Enter your GitHub oauth token
#   * Customize the API URLs to retrieve on lines 66-67
#   * ruby retrieve_github_issues
##

USER_TOKEN="yourtoken"

def get_response(url, retries = 0)
	response = HTTParty.get(url, :headers => {'Authorization' => "token #{USER_TOKEN}", 'User-Agent' => '@yholkamp'})

	if response.headers['status'] != "200 OK"
		puts "Received response: #{response.headers['status']}"
		get_response(url, retries - 1) if retries > 0
	else
		response
	end
end

def collect_api_results(url)
	all_data = []
	while url do
		puts url
		response = get_response(url, 2)

		puts response.headers['X-RateLimit-Remaining']

		data = JSON.parse response.body
		if data.is_a? Array
			all_data += data 
		else
			pp data
		end

		# Figure out what the next request should be
		linkbits = response.headers['Link'].scan /<(https:\/\/.+?)>; rel="next"/
		if linkbits == nil || linkbits == [] || linkbits.flatten! == []
			pp response.headers['Link'].scan /<(https:\/\/.+?)>; rel="next"/
			# we're done
			puts "Link header is empty, we're done!"
			url = nil
		else
			url = linkbits[0]
		end
	end
	all_data
end

closed_url = "https://api.github.com/repos/gitlabhq/gitlabhq/issues?direction=asc&sort=created&state=closed"
open_url = "https://api.github.com/repos/gitlabhq/gitlabhq/issues?direction=asc&sort=created&state=open"

all_data = collect_api_results(closed_url)

puts "Found #{all_data.count} closed issues"

all_data += collect_api_results(open_url)

puts "Found #{all_data.count} total issues"

File.open('issues.json', 'w') do |file|
	file.write JSON.generate all_data
end
