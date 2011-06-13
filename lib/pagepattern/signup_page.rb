#require 'module/commonmethod.rb'
#require 'co-reg_page.rb'
#require 'portal_page.rb'

module Websautotest
    module Pagepattern
        class Signup < Portal
            include Websautotest::CommonPageOperation
            def assertnewpage(times,step1text)
                $i=0
                while $i<times.to_i do
                    if @session.find("//div[contains(@id,'step1')]/descendant::*/span[@class='signup_bulletitle']").text == (step1text) then
                    break
                    end
                    noinfosignup(10)
                    clickstarted_goto_signup
                end
            end

            def assertnewsignup_fromemailsignup(times,step1text,email,username,type)
                $i=0
                while $i<times.to_i do
                    if @session.find("//div[contains(@id,'step1')]/descendant::*/span[@class='signup_bulletitle']").text == (step1text) then
                    break
                    end
                    emailsignup(10)
                    #puts email
                    #puts username
                    fill_email(email)
                    fill_password(username)
                    select_webstype(type)
                    clickstarted_goto_signup
                end
            end

            def assertthreestep(step1text,step2text,step3text)
                @session.find("//div[contains(@id,'step1')]/descendant::*/span[@class='signup_bulletitle']").text.should eql(step1text)
                @session.find("//div[@id='standardAccountFieldsWrapper3']/descendant::*/span[@class='signup_bulletitle']").text.should eql(step2text)
                @session.find("//div[@id='choose-pages']/descendant::*/span[@class='signup_bulletitle']").text.should eql(step3text)
            end

            def fill_signupemail(email)
                @session.fill_in "emailAddress", :with =>email
            end

            def fill_signuppassword(password)
                @session.fill_in "password", :with => password
            end

            def fill_SiteAddressAndTitle(sitename)
                @session.fill_in "siteAddress", :with => sitename
                @session.fill_in "siteTitle", :with => sitename
            end

            def assert_categorytype(type)
                @session.find("//div[@id='site_categories_container']/label[@class='for_category selected']").text.should include(type)
            end

            def select_template()
                @session.find("//li[1]/div/a").click
            end

            def select_pages()
                @session.find("//div[contains(@id,'recommended_pages')]/child::*/li[2]").check("chosenTemplateIds")
                @session.find("//div[contains(@id,'recommended_pages')]/child::*/li[4]").check("chosenTemplateIds")
                @session.find("//div[contains(@id,'recommended_pages')]/child::*/li[4]").check("chosenTemplateIds")
                @session.find("//div[contains(@id,'recommended_pages')]/child::*/li[4]").check("chosenTemplateIds")
                @session.find("//div[contains(@id,'recommended_pages')]/child::*/li[5]").check("chosenTemplateIds")
            end

            def clickregister_goto_coreg()
                @session.find("//input[@id='register']").click
                @Coreg=Coreg.new(@session)
            end

            def loopfor_newsignup

            end

        end
    end
end
