# Qimport

Qimport is a library for building Quickbooks iif files.

## Usage

```ruby
import = Qimport::Import.new('/path/to/file.iif')
import.group(:groupheader)
  .line({subitem: 'value', anotherfield: 'another value'})
  .line({anotherfield: 'a different value', anewfield: 'some new value'})
import.save
```

This would generate the following iif file

    !GROUPHEADER	SUBITEM	ANOTHERFIELD	ANEWFIELD
    GROUPHEADER	value	another value	
    GROUPHEADER		a different value	some new value

### Quickbooks Timer Activities Example

```ruby
import = Qimport::Import.new('/path/to/file.iif')
import
  .group(:timerhdr)
    .line({
      ver: 8,
      rel: 0,
      companyname: 'Company Name',
      importedbefore: 'N',
      fromtimer: 'Y',
      companycreatetime: 1378838210
    })

import
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

import
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

import.save
```
