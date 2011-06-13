module Websautotest
    module Pagepattern
        class Dashboard
            include Websautotest::CommonPageOperation
            def assertwebsover(iframename)
                @session.should have_xpath("//div[@id='websover_header']/span[@id='websover_title']")
                @session.find("//div[@id='websover_header']/span[@id='websover_title']").text.should eql(iframename)
            end
            
            def selectsite_dropdown(sitename)
               @session.within_frame('websover_iframe') do
                    @session.find("//div[@id='select_container']").select sitename , :from =>'userID'
                    @session.find("//input[@id='submitButton']").click
                end   
            end
            
        end

    end
end