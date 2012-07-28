# -*- coding:utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include CoderWaller

describe Coderwaller do
  it { Coderwaller::VERSION.should eq '0.0.3' }
end
