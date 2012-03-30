# Coderwaller [![Build Status](https://secure.travis-ci.org/conmame/Coderwaller.png)](http://travis-ci.org/conmame/Coderwaller) [![Gem Status](https://gemnasium.com/conmame/Coderwaller.png)](https://gemnasium.com/conmame/Coderwaller)
coderwaller is coderwall.com API Library. Get User Achievement.

## Installation
Require ruby version >= 1.9

    $ gem install coderwaller
    
or

    $ git clone git://github.com/conmame/Coderwaller.git Coderwaller
    $ cd Coderwaller
    $ bundle install
    $ bundle exec rake install

## Usage

    require 'coderwaller'
    include CoderWaller
    
    #user_name is coderwall username.
    user_achievement = CoderwallerApi.get_user_achievement(user_name)
    
    #get username
    puts user_achievement[:name]
    
    #get location
    puts user_achievement[:location] unless user_achievement[:location].nil?
    
    #get endorsements
    puts user_achievement[:endorsements]
    
    #get accounts
    #check user_achievement[:accounts].nil?
    user_achievement[:accounts].each do |account, name|
      puts account
      puts name
    end
    
    #get badges
    user_achievement[:badges].each do |badge|
      #badge name
      puts badge.name
      
      #badge description
      puts badge.description
      
      #badge icon url
      puts badge.badge
    end

## TODO
* 色々綺麗にする
  
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
  
## LICENCE
* Copyright © 2012 con_mame. See LICENSE.txt for further details.