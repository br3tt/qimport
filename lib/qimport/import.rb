module Qimport
  class Import
    def initialize(export_file_path)
      @export_file_path = export_file_path
      @groups = []
    end

    def group(*headers)
      @groups << group = Group.new(*headers)
      group
    end

    def save
      File.open( @export_file_path, 'w' ) do |writer|
        @groups.each do |g|
          writer << g.to_s
        end
      end
    end
  end
end

require 'qimport/group'
