class Qimport::Group
  def initialize(*headers)
    @headers = {}
    headers.first.each do |header|
      @headers[header] = {lines: [], columns: []}
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
    @headers.map do |k,v|
      header = k.to_s.upcase
      columns_to_s = v[:columns].map{|c| c.to_s.upcase}.join("\t")

      s << "!#{header}\t#{columns_to_s}\r\n"

      v[:lines].map do |line|
        s << ([header] + array_to_empty_hash(v[:columns]).merge(line).map{|k,v| v }).join("\t")
        s << "\r\n"
      end
    end
    s
  end

  private
  def array_to_empty_hash(array)
    hash = {}
    array.each do |i|
      hash[i] = ''
    end
    hash
  end
end
