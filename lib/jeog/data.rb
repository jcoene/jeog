require 'jeog/version'
require 'multi_json'

module Jeog

  class Data

    def initialize(json_string)
      @jeog_hash = MultiJson.decode json_string
    end

    def add_file_stat(file_stat)
      @jeog_hash["jeogFileAttributes"] = { "aTime" => file_stat.atime, "mTime" => file_stat.mtime, "cTime" => file_stat.ctime }
    end

    def to_json
      MultiJson.encode @jeog_hash
    end

  end
end
