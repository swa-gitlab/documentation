require 'json'
require 'date'
require 'pp'

##
# GitHub issue analyzer
# 
# Counts issues matching a few heuristics to get a feeling for the number of issues posted regarding several topics
#
# Requirements:
#  * Ruby
#
# Usage: 
#   * ruby analyze_github_issues.rb outfile.csv
##

if ARGV.length == 0
  puts "Usage: \nruby analyze_github_issues.rb outfile.csv"
  exit
end

# Increments, regardless whether a value is present or not
def inc(hash, key)
  hash[key] ||= 0
  hash[key] += 1
end

# Read the issues JSON
raw_data = File.read('issues.json');
data = JSON.parse raw_data;

puts "Read #{data.count} issues from issues.json"

# Crude storage for the issue counts
new_installation_counts = {}
open_installation_counts = {}
new_dependency_counts = {}
open_dependency_counts = {}
total_counts = {}
total_open = {}

# Calculate the number of installation & dependency issues
data.each do |issue|
  body = issue["body"]

  next if body.nil?

  # Match the issue to our classification heuristics
  is_installation_issue = body.match(/install|deployment/i)
  is_dependency_issue = is_installation_issue && body.match(/bundle\s+install|gem|dependency/i)

  # Parse the dates
  created_at = DateTime.parse(issue["created_at"])
  closed_at  = issue["closed_at"] ? DateTime.parse(issue["closed_at"]) : Date.today

  month_hash_key = created_at.strftime('%Y-%m-01')

  # Count the issue towards its categories
  inc(total_counts, month_hash_key)
  inc(new_installation_counts, month_hash_key) if is_installation_issue
  inc(new_dependency_counts, month_hash_key) if is_dependency_issue

  # Iterate over the months that the issue has been open
  (Date.new(created_at.year, created_at.month)..closed_at).select {|d| d.day == 1}.each  do |active_date| 
    key = active_date.strftime('%Y-%m-01')

    # Count the issue towards the relevant counts
    inc(total_open, key)
    inc(open_installation_counts, key) if is_installation_issue
    inc(open_dependency_counts, key) if is_dependency_issue
  end
end


puts "Writing to csv"

keys = new_installation_counts.keys + new_dependency_counts.keys
keys.uniq!.sort

File.open(ARGV[0], 'w') do |file|
  file.write %{"Date","Total issues","Total open issues","Open installation issues","New installation issues","Open dependency issues","New dependency issues"\n}

  keys.each do |key|
    outputs = []
    outputs << key
    outputs << total_counts[key]
    outputs << total_open[key]
    outputs << (open_installation_counts[key] || 0)
    outputs << (new_installation_counts[key] || 0)
    outputs << (open_dependency_counts[key] || 0)
    outputs << (new_dependency_counts[key] || 0)
    file.write outputs.join(",") + "\n"
  end
end
