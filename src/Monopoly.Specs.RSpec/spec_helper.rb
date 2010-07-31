$: << './src/Monopoly/bin/Debug'

require 'Monopoly.dll'
require 'spec'
include Monopoly

#hard coding link so it's found in rake
#not sure why I have to do this, need to investigate
require 'C:/Program Files (x86)/IronRuby/Lib/ironruby/gems/1.8/gems/caricature-0.7.6/lib/caricature'
include Caricature