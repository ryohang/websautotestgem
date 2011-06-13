
module Websautotest
    module Pagepattern
        class Coreg
            include Websautotest::CommonPageOperation
            def assertpackageindex(*package)
                package.each do |package|
                    @session.should have_xpath("//a[contains(@href, 'members.webs.com/premium/checkout') and contains(@href, '#{package}')]")
                end
            end

            def clicknothanks_goto_sitebuilder(nothankstring)
                if @session.has_xpath?("//div[@id='left_content']/descendant::*/img[contains(@title,'#{nothankstring}')]")
                    @session.find("//div[@id='left_content']/descendant::*/img[contains(@title,'#{nothankstring}')]").click
                elsif @session.has_xpath?("//div[@id='left_content']/descendant::*/span[contains(text(),'#{nothankstring}')]")
                    @session.find("//div[@id='left_content']/descendant::*/span[contains(text(),'#{nothankstring}')]").click
                end
                @Sitebuilder=Sitebuilder.new(@session)
            end

        end

    end
end