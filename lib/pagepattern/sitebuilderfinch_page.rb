module Websautotest
    module Pagepattern
        class Sitebuilderfinch
          include Websautotest::CommonPageOperation
          def dragelement_into_iframe(modulename,iframe)
            srclocation=nil
            @session.within_frame(iframe) do
              srclocation=@session.driver.browser.find_element(:xpath,"//div[@id='secondary']/descendant::*/div[@class='bldr-container']").location
            end     
              targetlocation=@session.driver.browser.find_element(:xpath,"//div[@data-moduletype='#{modulename}']").location
              offsetwidth=@session.driver.browser.find_element(:xpath,"//div[@data-moduletype='#{modulename}']").style("width").to_i
              offsetheight=@session.driver.browser.find_element(:xpath,"//div[@data-moduletype='#{modulename}']").style("height").to_i
              right=srclocation.x- targetlocation.x+offsetwidth
              down= srclocation.y - targetlocation.y+offsetheight
              @session.driver.browser.find_element(:xpath,"//div[@data-moduletype='#{modulename}']/descendant::*/span").drag_and_drop_by(right,down)
          end

      def assertdroppedelement(modulename,iframe)
           @session.within_frame(iframe) do
              @session.should have_xpath("//div[@id='secondary']/descendant::*/div[@class='bldr-container']/h3[@class='webs-#{modulename}']")
           end
       end
       
       def editText(modulename,context,iframe)
            @session.within_frame(iframe) do
            @session.driver.browser.find_element(:xpath,"//div[@id='secondary']/descendant::*/div[@class='bldr-container']/h3[@class='webs-#{modulename}']").click
            @session.driver.browser.find_element(:xpath,"//div[@id='secondary']/descendant::*/div[@class='bldr-container']/h3[@class='webs-#{modulename}']").send_keys context
            end 
       end
      
       def assertnewText(modulename,context,iframe)
          @session.within_frame(iframe) do
           @session.find(:xpath,"//div[@id='secondary']/descendant::*/div[@class='bldr-container']/h3[@class='webs-#{modulename}']").text.should include(context)
          end
       end
    end
   end  
end          
          


