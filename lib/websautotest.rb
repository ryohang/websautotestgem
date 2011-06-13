#$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))


module Websautotest
  autoload :CommonPageOperation,       'module/commonmethod'
  module Pagepattern
    autoload :Portal,                    'pagepattern/portal_page'
    autoload :Signup,                    'pagepattern/signup_page'
    autoload :Coreg,                     'pagepattern/co-reg_page'
    autoload :Sitebuilder,               'pagepattern/sitebuilder_page'
    autoload :Dashboard,                 'pagepattern/dashboard_page'
    autoload :Shopcart,                  'pagepattern/shopcart_page' 
  end  
end