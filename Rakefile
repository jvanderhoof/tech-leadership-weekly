require 'bundler'
Bundler.setup

Bundler.load.specs.each do |spec|
  spec.load_paths.each do |load_path|
    Dir.glob("#{load_path}/**/*.rake").each do |rake_file|
      load rake_file
    end
  end
end
