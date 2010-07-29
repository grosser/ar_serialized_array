require "spec/spec_helper"

describe 'ar_serialized_array' do
  describe 'basics' do
    it "is an empty array by default" do
      UserPlain.new.product_ids.should == []
    end

    it "serializes on set" do
      user = UserPlain.create!(:product_ids => [1, 2])
      UserPlain.find(user.id).product_ids.should == [1, 2]
    end

    it "can save an empty array" do
      user = UserPlain.create!(:product_ids => [])
      UserPlain.find(user.id).product_ids.should == []
    end

    it "can save nil" do
      user = UserPlain.create!(:product_ids => nil)
      UserPlain.find(user.id).product_ids.should == []
    end

    it "stores nil when nil is saved" do
      user = UserPlain.create!(:product_ids => nil)
      UserPlain.first(:conditions => {:id => user.id, :product_ids => nil}).should == user
    end

    it "stores empty arrays as NULL" do
      user = UserPlain.create!(:product_ids => [])
      UserPlain.first(:conditions => {:id => user.id, :product_ids => nil}).should == user
    end

    it "can search by array" do
      user = UserPlain.create!(:product_ids => [1])
      UserPlain.first(:conditions => {:id => user.id, :product_ids => [1].to_yaml}).should == user
    end

    it "raises when non-array is given" do
      lambda{ UserPlain.create!(:product_ids => '') }.should raise_error
    end
  end

  describe 'with accessor' do
    it "can access the array as text" do
      UserWithAccessor.new(:product_ids => [1,2,3]).product_ids_as_text.should == '1, 2, 3'
    end

    it "can set arrays via text" do
      UserWithAccessor.new(:product_ids_as_text => '1, 2, 3').product_ids.should == ['1','2','3']
    end

    it "is symetric" do
      text = '1, 2, 3'
      UserWithAccessor.new(:product_ids_as_text => text).product_ids_as_text.should == text
    end

    it "accepts nil as empty" do
      UserWithAccessor.new(:product_ids_as_text => nil).product_ids.should == []
    end

    it "is blank when unset" do
      UserWithAccessor.new.product_ids_as_text.should == ''
    end

    it "is blank when empty" do
      UserWithAccessor.new(:product_ids => []).product_ids_as_text.should == ''
    end
  end

  describe 'with on_set' do
    it "is used when storing normally" do
      User.new(:product_ids => ['1','2','2']).product_ids.should == [1,2]
    end

    it "is used when storing through accessor" do
      User.new(:product_ids_as_text => '1,2,2').product_ids.should == [1,2]
    end
  end

  it "has a VERSION" do
    ARSerializedArray::VERSION.should =~ /^\d+\.\d+\.\d+$/
  end
end