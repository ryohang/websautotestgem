module Websautotest
    module Pagepattern
        class Sitemanager
            include Websautotest::CommonPageOperation
        end
        def clickpage_goto_sitebuilderfinch(pagename)
          @session.find("//dl[@id='visible_page_list']/descendant::*/a[@title='#{pagename}']").click
          @Sitebuilderfinch=Sitebuilderfinch.new(@session)
        end
    end
end