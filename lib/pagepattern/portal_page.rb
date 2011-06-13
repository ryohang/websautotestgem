#require 'module/commonmethod'

#require 'signup_page'

module Websautotest
    module Pagepattern
        class Portal
            include Websautotest::CommonPageOperation
            #  class << self;
            #    attr_accessor :useremail
            #    attr_accessor :userpass
            #   end
            def noinfosignup(repeattimes)
                lookfor_signuppage(repeattimes,"//div[contains(@id,'get_started_block') and contains(@style,'display: block')]")
            end

            def clickstarted_goto_signup
                @session.find("//div[contains(@style,'display: block')]/descendant::input[contains(@id,'signup_button')]").click
                @Signup=Signup.new(@session)
            end

            def emailsignup(repeattimes)
                lookfor_signuppage(repeattimes,"//div[contains(@class,'gwo_streamlined_signup with_type hidden') and contains(@style,'display: block')]")
            end

            def fill_email(email)
                @session.within("//div[contains(@class,'gwo_streamlined_signup with_type hidden') and contains(@style,'display: block')]") do
                    @session.fill_in "email_address", :with =>email
                end
            end

            def fill_password(password)
                @session.within("//div[contains(@class,'gwo_streamlined_signup with_type hidden') and contains(@style,'display: block')]") do
                    @session.fill_in "register_password", :with => password
                end
            end

            def select_webstype(type)
                @session.find("//div[contains(@style,'display: block')]/descendant::div[@class='select_selected']").click
                @session.find("//div[contains(@style,'display: block')]/descendant::li[contains(text(),'#{type}')]").click
            end

            def lookfor_signuppage(repeattime,xpath)
                $i=0
                while $i<repeattime.to_i do
                    if @session.has_xpath?(xpath) then
                    break
                    end
                    @session.reset!
                    @session.visit "/"
                    $i+=1;
                end

            end
        end

    end

end