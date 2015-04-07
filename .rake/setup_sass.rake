module Rhizome
  module Utils
    attr_accessor :rails
    attr_accessor :sprockets
    attr_accessor :sass_dir

    def rails?
      @rails
    end
    
    def sprockets?
      @sprockets
    end

  end
end

namespace "setup" do
  include Rhizome::Utils

  desc "Create various sass files (mixins, partials, modules) and directory structure."
  task :sass, :sass_dir do |t, args|

    if File.directory?(File.join("app", "assets", "stylesheets"))
      puts "\nThis appears to be a Rails/Sprockets app, so directories will be created under app/assets/stylesheets"
      @rails = true
      @sass_dir = File.join("app", "assets", "stylesheets")
    elsif File.directory?(File.join("assets", "stylesheets"))
      puts "\nThis appears to be a Sprockets app, so directories will be created under assets/stylesheets"
      @sprockets = true
      @sass_dir = File.join("assets", "stylesheets")
    end

    if args[:sass_dir] && !@sass_dir
      @sass_dir = args[:sass_dir]
    else
      @sass_dir = Dir.pwd
    end

    `cp -R ~/.rake/sass/* #{@sass_dir}`

    #["mixins", "modules", "partials", "vendor"].each do |dir_name|
      #dir = "#{@sass_dir}/#{dir_name}"
      #FileUtils.mkdir_p dir
      #`touch #{dir}/.gitkeep`
    #end

  end
end
