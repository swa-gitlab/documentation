require 'rubygems'
require 'grit'
require 'pp'

##
# Gem dependency calculator
# 
# Counts the number of unique production and development gems listed in the project's Gemfile 
# and writes the results to csv.
#
# Requirements:
#  * Ruby
#  * rubygems
#  * grit
#
# Usage: ruby calculcate_dependencies.rb path/to/git/repository output.csv
##

if ARGV.length < 2
	puts "Usage: ruby calculcate_dependencies.rb path/to/git/repository output.csv"
	exit
end

def extract_gems(data)
	data.scan(/[^#][ \t]*gem ['"](.+?)['"](?:,.+)?/)
end

def to_csv(array)
	File.open(ARGV[1], 'w') do |file|
		# Write csv header
		columns = array.first.keys
		file.write columns.map {|k| %{"#{k}"}}.join(',') + "\n"

		# Write values
		array.each do |ar|
			values = []
			columns.each_with_index do |col, index|
				# Wrap value if it's not an int
				value = ar[col].is_a?(Integer) ? ar[col] : %{"#{ar[col]}"}
				values << value
			end
			file.write values.join(",") + "\n"
		end
	end
end

counts = []

repo = Grit::Repo.new(ARGV.first)
repo.log('master', 'Gemfile').each do |commit|
	file = commit.tree/'Gemfile'

	# Count all gems
	development_gems = extract_gems(file.data)
	
	# Count the non-test/development gems
	production_file = file.data.gsub /(group (?::development|:test|, )+ do.+?end)/m, ''
	production_gems = extract_gems(production_file)
	
	counts << {
		:date => commit.date.strftime('%m-%d-%Y %H:%M:%S'),
		:production => production_gems.uniq.count,
		:development => development_gems.uniq.count
	}
end

to_csv(counts.reverse)
