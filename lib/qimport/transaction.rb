class Qimport::Transaction
  attr_accessor :data, :distribution_lines

  def initialize(data)
    @data = data

    @distribution_lines = []
  end

  def line(data)
    data = data

    @distribution_lines << data
  end
end
