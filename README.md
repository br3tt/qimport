# Qimport

Qimport is a library for building Quickbooks iif files.

## Usage

    qimport = Qimport.new('/path/to/file.iif')
    qimport.group(:groupheader)
      .line({subitem: 'value', anotherfield: 'another value'})
    qimport.save

This would generate the following iif file

    !GROUPHEADER	SUBITEM	ANOTHERFIELD
    GROUPHEADER	value	another value

### Quickbooks Timer Activities Example

    qimport = Qimport.new('/path/to/file.iif')
    qimport
      .group(:timerhdr)
        .line({
          ver: 8,
          rel: 0,
          companyname: 'Company Name',
          importedbefore: 'N',
          fromtimer: 'Y',
          companycreatetime: 1378838210
        })

    qimport
      .group(:hdr)
        .line({
          prod: 'Quickbooks Pro for Windows',
          ver: 'Version 6.0D',
          rel: 'Release R4P',
          iifver: 1,
          date: '9/4/2013',
          time: 1208545205,
          accntnt: 'N',
          accntntsplittime: 0
        })

    qimport
      .group(:timeact)
        .line({
          date: '9/16/2013',
          job: 'Company:Job',
          emp: 'Joe Employee',
          item: 'Item',
          pitem: '',
          duration: '4:20',
          proj: '',
          note: 'some comment',
          billingstatus: 0
        })
      .line({
        date: '9/17/2013',
        job: 'Company:Job',
        emp: 'Jim Employee',
        item: 'Another item',
        pitem: '',
        duration: '0:20',
        proj: '',
        note: 'another comment',
        billingstatus: 0
      })

    qimport.save
