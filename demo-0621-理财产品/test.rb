require 'yaml'
require 'json'

puts ARGV[0]

class Parser
  def initialize(file_name)
    @file_name = file_name
  end

  def load
    YAML.load_file @file_name
  end

  def to_json
    JSON.generate self.load
    # JSON.pretty_generate self.load
  end

  def to_json_and_save
    json = self.to_json
    File.open "#{@file_name}.json", 'w' do |f|
      f.write json
    end
  end
end

parser = Parser.new ARGV[0]
puts parser.to_json
parser.to_json_and_save