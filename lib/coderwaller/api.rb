# -*- coding:utf-8 -*-

require 'uri'
require 'net/http'
require 'json'

module CoderWaller
  class UserAchievement
    attr_reader :name, :badge, :description

    def initialize(hashed_badge)
      @name, @description, @badge = hashed_badge.values
    end
  end

  class CoderwallerApi
    def self.get_user_achievement(user_name)
      begin
        user_name = nil if user_name.nil? || user_name == ""
        user_data = {:name => user_name, :msg => ''}
        raise(ArgumentError, 'No User Name is given!') if user_name.nil?
        url = URI.parse(URI.escape("http://coderwall.com/#{user_name}.json"))
        res = Net::HTTP.start(url.host, url.port) { |http|
          http.request(Net::HTTP::Get.new(url.path))
        }
        raise(ArgumentError, "User(#{user_name}) Not Found") if res.content_type == 'text/html' || res.code == '404'
        response = JSON.load(res.body)
      rescue ArgumentError => e
        user_data[:msg] =  e.message
      end

      unless response.nil?
        ['location', 'endorsements', 'accounts'].each do |k|
          user_data[k.to_sym] = response[k] unless response[k].nil?
        end
        user_data[:badges] = response['badges'].map { |badge| UserAchievement.new(badge) }
      end

      user_data
    end
  end
end
