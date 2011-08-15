require 'jeog/version'

module Jeog
  class File
    attr_accessor :file_name, :directory, :file

    def initialize(file_name)
      @file_name = file_name
      @directory, @file = ::File.split file_name
    end

    def stat
      ::File.stat @file_name
    end

    def raw_data
      ::IO.read @file_name
    end

    def json_data
      ::IO.read(@file_name, nil, 4)
    end

    def alternative_json_file
      "#{@file.gsub(/\.jeog/, '')}.json"
    end

  end
end
