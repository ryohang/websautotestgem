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
                @session.find("//div[contains(@class,'gwo_streamlined_signup with_type')]/descendant::input[contains(@id,'signup_button')]").click
                @Signup=Signup.new(@session)
            end

            def emailsignup(repeattimes)
                lookfor_signuppage(repeattimes,"//div[contains(@class,'gwo_streamlined_signup with_type')]")
            end

            def fill_email(email)
                @session.within("//div[contains(@class,'gwo_streamlined_signup with_type')]") do
                    @session.fill_in "email_address", :with =>email
                end
            end

            def fill_password(password)
                @session.within("//div[contains(@class,'gwo_streamlined_signup with_type')]") do
                    @session.fill_in "register_password", :with => password
                end
            end

            def select_webstype(type)
                @session.find("//div[contains(@class,'gwo_streamlined_signup with_type')]/descendant::div[@class='select_selected']").click
                @session.find("//div[contains(@class,'gwo_streamlined_signup with_type')]/descendant::li[contains(text(),'#{type}')]").click
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

            def click_signinpopup
                @session.find("//a[@id='sign_in_nav']/span").click
            end

            def fill_logincred(user,password)
                @session.within("//div[contains(@class,'clearfix sign_in_fields')]") do
                    @session.fill_in "FWloginUsername", :with => user
                    @session.evaluate_script("document.getElementById('FWloginPassword').focus()")
                    @session.fill_in "FWloginPassword2", :with=> password
                end
            end
            
            def clicksignin_goto_dashboard
               @session.find("//form[@id='login_leaf']/div[@class='clearfix sign_in_fields']/descendant::input[@id='sign_in_leaf']").click
               @Dashboard=Dashboard.new(@session)
            end
            
        end

    end

end