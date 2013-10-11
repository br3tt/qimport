module Qimport
  class Group
    def initialize(*headers)
      @headers = {}
      headers.each do |header|
        @headers[header] = {:lines => [], :columns => []}
      end
    end

    def line(data, header=nil)
      header ||= @headers.keys.first.to_sym

      @headers[header][:columns] =
        (@headers[header][:columns] + data.keys).uniq
      @headers[header][:lines] << data

      self
    end

    def to_s
      s = ''
      @headers.each do |k,v|
        header = k.to_s.upcase
        lines = v[:lines]
        columns = v[:columns]

        columns_to_s = columns.map{|c| c.to_s.upcase}.join("\t")

        s << "!#{header}\t#{columns_to_s}\r\n"

        lines.each do |line|
          empty_columns = array_to_empty_hash(columns)
          s << ([header] + empty_columns.merge(line).map{|k,v| v }).join("\t")
          s << "\r\n"
        end
      end
      s
    end

    private
    def array_to_empty_hash(array)
      Hash[array.zip []]
    end
  end
end
