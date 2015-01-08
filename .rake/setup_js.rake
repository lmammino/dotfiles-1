module Rhizome
  module Utils
    attr_accessor :rails
    attr_accessor :sprockets
    attr_accessor :requirejs

    URLS = {
            underscore: { 
              filename: 'underscore.js',
              url: 'https://raw.github.com/jashkenas/underscore/master/underscore.js'
            },
            backbone: { 
              filename: 'backbone.js',
              url: 'https://raw.github.com/jashkenas/backbone/master/backbone.js'
            },
            jquery1: { 
              filename: 'jquery.1x.js',
              url: 'http://code.jquery.com/jquery-1.10.2.js'
            },
            jquery2: {
              filename: 'jquery.2x.js',
              url: 'http://code.jquery.com/jquery-2.0.3.js'
            },
            requirejs: {
              filename: 'require.js',
              url: 'https://raw.github.com/jrburke/requirejs/master/require.js'
            }
    }

    def use_sprockets(js_dir=nil)
      puts "JavaScript directory will be 'javascripts'..." unless js_dir == "javascripts"
      @sprockets = true
    end

    def sprockets?
      @sprockets
    end

    def rails?
      @rails
    end

    def requirejs?
      @requirejs
    end

    def fetch_source(path, lib)

      unless (rails? && lib =~ /jquery/ || requirejs? && lib == 'requirejs')
        puts requirejs?
        puts "\nDownloading #{lib}..."
        filename = URLS[lib.to_sym][:filename]
        src = URLS[lib.to_sym][:url]

        #open(File.join(path, filename), 'wb') do |file|
          #file << open(src).read
          #puts "Done."
        #end
      end
      
    end

    def bail(dir_name)
      puts "\nTask halted. No #{dir_name} directory provided."
      exit
    end

  end
end

namespace "setup" do
  include Rhizome::Utils

  namespace "js" do
    desc "List configured JavaScript libraries"
    task :list do
      puts "\n-------------\n\n"
      URLS.keys.each do |k|
        puts "#{k}:  #{URLS[k][:url]}"
      end
      puts "\n-------------"
    end
  end

  desc "Setup default BackboneJS directories (for new projects)"
  task :backbone, :js_dir do |t, args|
    args.with_defaults(js_dir: "javascripts")
    cwd = Dir.pwd

    if File.directory? "app"
      @rails = true
      puts "\nUsing Rails directory structure..."
      use_sprockets(args[:js_dir])
      args[:js_dir] = "javascripts"
    else
      #rails = false
      puts "\nUse assets directory (e.g. Sprockets)?"
      if $stdin.gets.chomp.downcase =~ /y|yes/i
        use_sprockets
      else
        @sprockets = false
      end

      unless sprockets?
        puts "\nUse RequireJS?"
        if $stdin.gets.chomp.downcase =~ /y|yes/i
          @requirejs = true
        else
          @requirejs = false
        end
      end

    end

    if sprockets
      if rails?
        path = "app/assets/javascripts"
        FileUtils.mkdir_p path
      else
        path = "assets/javascripts"
        FileUtils.mkdir_p path
      end
    else
      path = "#{args[:js_dir]}"
      FileUtils.mkdir_p path
    end
    
    ["templates", "models", "collections", "views", "routers"].each do |dir_name|
      dir = "#{path}/#{dir_name}"
      FileUtils.mkdir_p dir
      `touch #{dir}/.gitkeep`
    end

    puts "\nBackbone directories created."
    task('setup:js').invoke(path)
  end

  desc "Creates lib directory and downloads dev (unminified) JavaScript libraries."
  task :js, :js_lib do |t, args|
    require 'net/http'
    require 'open-uri'

    if File.directory?(File.join("javascripts", "lib"))
      js_lib = File.join("javascripts", "lib")
    elsif File.directory?(File.join("app", "javascripts", "lib"))
      js_lib = File.join("app", "javascripts", "lib")
    end
    
    unless js_lib || args[:js_lib]
      puts "\nWhere would you like to create lib directory?"
      js_lib = $stdin.gets.chomp.downcase
      if js_lib == ""
        bail("JavaScript")
      end
      FileUtils.mkdir_p File.join(Dir.pwd, js_lib)
    else
      js_lib ||= args[:js_lib]
      js_lib << "/lib"
    end

    if File.directory? js_lib
      path = File.join(Dir.pwd, js_lib, "lib")
      puts "\nUsing lib directory under #{File.join(Dir.pwd, js_lib)} ..."
      FileUtils.mkdir_p path
    else
      #puts "\nNo lib directory found at: #{File.join(Dir.pwd, js_lib)}"
      puts "Creating lib directory at: #{File.join(Dir.pwd, js_lib)}"
      path = FileUtils.mkdir_p File.join(Dir.pwd, js_lib)
      #puts "Would you like to create it?"
      #if $stdin.gets.chomp.downcase =~ /y|yes/
        #path = File.join(Dir.pwd, js_lib)
        #FileUtils.mkdir_p path
        #puts "Directory '#{js_lib}' created."
      #else
        #bail("lib")
      #end
    end
    URLS.keys.each { |l| fetch_source(path, l)}
  end

end
