require 'qimport/import'

describe Qimport::Import do
  before do
    Qimport::Group.stub(:new){|*groups| groups.first }

    @import = Qimport::Import.new(file_path = '/path/to/file.iif')

    @import.group(:group1)
    @import.group(:group2)

    file = double('file')
    @file_contents = ''
    file.stub(:<<){|contents| @file_contents << contents }

    File.should_receive(:open).with(file_path, 'w').and_yield(file)

    @import.save
  end

  it 'should write each group to the file' do
    @file_contents.should == 'group1group2'
  end
end
