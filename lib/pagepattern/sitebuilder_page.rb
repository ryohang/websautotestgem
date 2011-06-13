#require 'module/commonmethod'

module Websautotest
    module Pagepattern
        class Sitebuilder
            include Websautotest::CommonPageOperation
            def assertpagetitle(titlestring)
                @session.find("//a[contains(text(),'Site Builder')]").text.should eql titlestring
            end
        end

    end
end