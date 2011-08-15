require 'jeog/version'
require 'jeog/file'
require 'jeog/data'
require 'trollop'

module Jeog

  class Cli

    def self.parse_options
      @opts = Trollop::options do
        version "jeog #{Jeog::VERSION}"
        banner 'Usage: jeog [OPTION]... [FILE]...'
        banner ''
        opt :version, 'Print version and exit', :short => 'v'
        opt :help, 'Show this message', :short => 'h'
      end
      Trollop::die 'requires at least one file to be given' if ARGV.empty?
      @files = ARGV[0..-1]
    end

    def self.go
      parse_options

      @files.each do |file_name|
        begin
          file = Jeog::File.new file_name
          data = Jeog::Data.new file.json_data
          data.add_file_stat file.stat
          dest_file_name = "#{file.directory}/#{file.alternative_json_file}"
          ::File.open(dest_file_name, 'w') { |f| f.write(data.to_json) }
        rescue Errno::ENOENT
          puts "jeog: #{file_name}: No such file or directory"
          exit 1
        rescue Errno::EACCES
          puts "jeog: #{file_name}: Permission denied"
          exit 1
        rescue Errno::EISDIR
          puts "jeog: #{file_name}: Is a directory"
          exit 1
        rescue Errno::EPIPE
          exit 1
        end
      end

    end

  end

end