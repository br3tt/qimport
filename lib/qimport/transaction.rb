class Qimport::Transaction
  attr_accessor :data, :distribution_lines

  DEFAULT_DATA = {
    'BILL' => {
      trnsid:'',
      trnstype: '',
      date: '',
      accnt: '',
      name: '',
      class: '',
      amount: '',
      docnum: '',
      memo: '',
      clear: '',
      toprint: '',
      addr5: '',
      duedate: '',
      terms: ''
    },
    'INVOICE' => {
      trnsid:'',
      trnstype: '',
      date: '',
      accnt: '',
      name: '',
      class: '',
      amount: '',
      docnum: '',
      memo: '',
      clear: '',
      toprint: '',
      addr1: '',
      addr2: '',
      addr3: '',
      addr4: '',
      addr5: '',
      duedate: '',
      terms: '',
      paid: '',
      shipdate: ''
    }
  }

  DEFAULT_LINE_DATA = {
    'BILL' => {
      splid: '',
      trnstype: '',
      date: '',
      accnt: '',
      name: '',
      class: '',
      amount: '',
      docnum: '',
      memo: '',
      clear: '',
      qnty: '',
      reimbexp: '',
      servicedate: '',
      other2: ''
    },
    'INVOICE' => {
      splid: '',
      trnstype: '',
      date: '',
      accnt: '',
      name: '',
      class: '',
      amount: '',
      docnum: '',
      memo: '',
      clear: '',
      qnty: '',
      price: '',
      invitem: '',
      paymeth: '',
      taxable: '',
      reimbexp: '',
      extra: '',
      servicedate: ''
    },
  }

  def initialize(data)
    @data = DEFAULT_DATA[data[:trnstype]].merge(data)

    @distribution_lines = []
  end

  def line(data)
    data = DEFAULT_LINE_DATA[data[:trnstype]].merge(data)

    @distribution_lines << data
  end
end
