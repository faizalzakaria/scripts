#!/usr/bin/env ruby

def replace_string(file, string_1, string_2)
  string = IO.read(file)
  string.gsub!("#{string_1}", "#{string_2}")
  File.open(file, 'w') { |file| file.write(string) }
end

Dir["#{ARGV[0]}"].each do |file|
  next if File.directory? file
  puts "Processing #{file} ..."
  replace_string file, ARGV[1], ARGV[2]
end

