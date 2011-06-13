# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('websautotest', '0.1.0') do |p|
  p.description    = "webs autotest gem package"
  p.url            = "https://ryohang@github.com/ryohang/websautotestgem.git"
  p.author         = "Ryo Hang"
  p.email          = "ryo@webs.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }