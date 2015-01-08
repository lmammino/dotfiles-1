#!/usr/bin/env ruby

require 'yaml'

configs = YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))

profile_name_input = ARGV[0]
case profile_name_input
when 'default'
  profile_name = 'default'
when nil
  profile_name = 'default'
when ""
  profile_name = 'default'
else
  profile_name = "#{profile_name_input}"
end

id = configs[profile_name]['aws_access_key_id']
key = configs[profile_name]['aws_secret_access_key']

puts "export AWS_ACCESS_KEY_ID=#{id}"
puts "export AWS_SECRET_ACCESS_KEY=#{key}"
