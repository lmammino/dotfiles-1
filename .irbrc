# coding: utf-8

require 'wirb'

Wirb.start

def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

def pbpaste
  `pbpaste`
end

# Log to STDOUT if in Rails
#if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  #require 'logger'
  #RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  ## Display the RAILS ENV in the prompt
  ## ie : [Development]>>
  #IRB.conf[:PROMPT][:CUSTOM] = {
   #:PROMPT_N => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   #:PROMPT_I => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   #:PROMPT_S => nil,
   #:PROMPT_C => "?> ",
   #:RETURN => "=> %s\n"
   #}
  ## Set default prompt
  #IRB.conf[:PROMPT_MODE] = :CUSTOM
#end
