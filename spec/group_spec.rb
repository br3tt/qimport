require 'qimport/group'

describe Qimport::Group do
  before do
    @group = Qimport::Group.new(:group1, :group2)

    @group.line({:first => 'first value 1', :second => 'second value 1'})
    @group.line({:second => 'second value 2', :first => 'first value 2'}, :group1)
    @group.line({:whatever => 'something'}, :group2)
  end

  it 'should return group as string in quickbooks format' do
    @group.to_s.should == ["!GROUP1\tFIRST\tSECOND",
                           "GROUP1\tfirst value 1\tsecond value 1",
                           "GROUP1\tfirst value 2\tsecond value 2",
                           "!GROUP2\tWHATEVER",
                           "GROUP2\tsomething\r\n"].join("\r\n")
  end
end
