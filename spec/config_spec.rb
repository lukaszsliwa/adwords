require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Adwords::Config do

  subject { Adwords::Config }

  describe ".options" do

    context "returns default hash" do

      it "should contains authentication key" do
        subject.options.should have_key(:authentication)
      end

      it "should contains service key" do
        subject.options.should have_key(:service)
      end

      it "should contains connection key" do
        subject.options.should have_key(:connection)
      end

    end

  end

  describe ".option" do

    context "creates config option" do

      it "should sets, gets correct value and checks key" do
        subject.option(:test1, :on => :authentication)
        subject.test1 = 'TEST123'
        subject.test1.should eq('TEST123')
        subject.test1?.should be_true
      end

      it "shouldn't set, get and return false" do
        subject.option(:test2, :on => :authentication)
        subject.test2.should be_nil
        subject.test2?.should be_false
      end

    end
  end

end
