require "toml"
require "colorize"
require "option_parser"

def return_err
  puts "#{"ERROR:".colorize(:black).on(:red)} Configuration file (gimbap.toml) was not found! Please create the configuration file and ensure you have added all necessary fields!"
  exit(1)
end

def read_and_parse : Hash
  contents_from_toml = Hash(String, TOML::Type).new
  if File.exists?("gimbap1.toml") 
    content = File.read("gimbap1.toml")
    contents_from_toml = TOML.parse(content)
  else
    return_err()
  end
  
  config = contents_from_toml["config"].as(Hash)
end

OptionParser.parse do |parser|
    config = read_and_parse()

    parser.banner = "Welcome to #{"김밥!".colorize.bold} How can I help?"
    
    parser.on "--v", "--version", "Show the current version" do
      puts "Version 0.1.0"
      exit
    end
  
    parser.on "--h", "--help", "Show Gimbap commands" do
      puts parser
      exit
    end
  
    parser.on "--b", "--build", "Build project" do
      puts "Gimbap: Building a #{config["language"].to_s.capitalize} Project...".colorize.bold
      system `echo #{config["language"]} #{config["mainfile"]} #{config["flag"]}`
  
      if $?.success? 
        puts "#{"Gimbap: Build for #{config["language"].to_s.capitalize} Finished! Enjoy!".colorize.bold}"
      end
      exit
    end
end
