# -*- coding:utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def mock_file(file_name)
  open(File.expand_path(File.dirname(__FILE__) + "/../mock/#{file_name}.json")).read
end

def set_webmock(name, file_name, status_code = 200, content_type = 'application/json')
  WebMock.stub_request(:get, "http://coderwall.com/#{name}.json").
  to_return(:status => status_code, :body => mock_file(file_name), :headers => { 'Content-Type' => content_type } )
end

describe CoderWaller::CoderwallerApi do
  describe :get_user_achievement do

    before do
      set_webmock('ok', 'success')
      set_webmock('hoge', 'empty', 404, 'application/json')
      set_webmock('piyo', 'bad', 404, 'text/html')
    end

    context "exist user is given" do
      subject { CoderwallerApi.get_user_achievement('ok') }
      its([:name]) { should eq 'ok' }
      its([:msg]) { should eq '' }
      its([:location]) { should eq "Tokyo" }
      its([:endorsements]) { should eq 10 }
      
      it "success result data (accounts)" do
        account = subject[:accounts]
        account["github"].should == 'hoge'
      end

      it "success result data (badges)" do
      	badges = subject[:badges].first
        badges.name.should == 'Walrus'
        badges.description.should == 'The walrus is no stranger to variety. Use at least 4 different languages throughout all your repos'
        badges.badge.should == 'http://cdn.coderwall.com/assets/badges/walrus-afb03ee2081181fd46740fe41cf6a254.png'
        subject[:badges].size.should == 4
      end
    end

    context "no user name is given" do
      subject { CoderwallerApi.get_user_achievement('') }
      its([:msg]) { should eq 'No User Name is given!' }
      its([:name]) { should be nil }
      its([:badges]) {should be nil}
    end

    context "not exist user is given" do
      subject { CoderwallerApi.get_user_achievement("hoge") }
      its([:msg]) { should eq 'User(hoge) Not Found' }
      its([:name]) { should eq 'hoge' }
      its([:badges]) {should be nil}
    end

    context "bad argument is given" do
      subject { CoderwallerApi.get_user_achievement("piyo") }
      its([:msg]) { should eq 'User(piyo) Not Found' }
      its([:name]) { should eq 'piyo' }
      its([:badges]) {should be nil}
    end
  end
end
