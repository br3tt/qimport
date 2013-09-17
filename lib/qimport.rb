class Qimport
  def initialize(export_file_path)
    @export_file_path = export_file_path
    @groups = []
  end

  def group(*headers)
    group = Group.new(headers)
    @groups << group
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

require 'qimport/group'
