require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Adwords do

  describe ".configure" do

    context "when we yield a block" do

      it "should sets a configuration parameters" do
        Adwords.configure do |config|
          config.environment = 'sandbox'
        end
      end

    end

    context "when we don't yield a block" do

      it "should returns an configuration instance" do
        Adwords.configure.should eq(Adwords::Config)
      end

    end

  end

end
