class Qimport
  def initialize(export_file_path)
    @export_file_path = export_file_path
    @transactions = []
  end

  def transaction(data)
    transaction = Transaction.new(data)
    @transactions << transaction

    transaction
  end

  def save
    File.open( @export_file_path, 'w' ) do |writer|
      transfer_headers, line_headers = combined_headers

      writer << "!TRNS\t#{hash_to_headers(transfer_headers)}\r\n"
      writer << "!SPL\t#{hash_to_headers(line_headers)}\r\n"
      writer << "!ENDTRNS\r\n"

      @transactions.each do |trans|
        next if trans.distribution_lines.empty?

        remapped_trans_data = transfer_headers.merge(trans.data)
        writer << "TRNS\t#{hash_to_values(remapped_trans_data)}\r\n"

        trans.distribution_lines.each do |line|
          remapped_line_data = line_headers.merge(line)
          writer << "SPL\t#{hash_to_values(remapped_line_data)}\r\n"
        end
        writer << "ENDTRNS\r\n"
      end
    end
  end

  private
  def combined_headers
    all_trans, all_lines = {}, {}

    @transactions.each do |trans|
      all_trans = all_trans.merge(trans.data)

      trans.distribution_lines.each do |line|
        all_lines = all_lines.merge(line)
      end
    end

    return clear_values(all_trans), clear_values(all_lines)
  end

  def clear_values(hash)
    Hash[hash.map{|k,v| [k, '']}]
  end

  def hash_to_headers(hash)
    hash.map{|k,v| k.to_s.upcase}.join("\t")
  end

  def hash_to_values(hash)
    hash.map{|k, v| v}.join("\t")
  end
end

require 'qimport/transaction'
