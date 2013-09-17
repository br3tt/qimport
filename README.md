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

