module Websautotest
    module Pagepattern
        class Sitebuilderfinch
          include Websautotest::CommonPageOperation
          def wait_for_iframe_to_load(iframe)
            @session.wait_until(10){@session.should have_xpath("//iframe[@id='#{iframe}']")}
          end
          def dragelement_into_iframe(modulename,iframe)
            srclocation=nil
            @session.within_frame(iframe) do
              srclocation=@session.driver.browser.find_element(:xpath,"//div[@id='body-wrapper-full']/descendant::*/div[contains(@class,'bldr-container')]").location
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
              @session.should have_xpath("//div[@id='body-wrapper-full']/descendant::*/div[contains(@class,'bldr-container')]/div[@class='webs-#{modulename}']")
           end
       end
       
       def editText(modulename,context,iframe)
            @session.within_frame(iframe) do
            @session.driver.browser.find_element(:xpath,"//div[@id='body-wrapper-full']/descendant::*/div[contains(@class,'bldr-container')]/div[@class='webs-#{modulename}']").click
            @session.driver.browser.find_element(:xpath,"//div[@id='body-wrapper-full']/descendant::*/div[contains(@class,'bldr-container')]/div[@class='webs-#{modulename}']").send_keys context
            end 
       end
      
       def assertnewText(modulename,context,iframe)
          @session.within_frame(iframe) do
           @session.find(:xpath,"//div[@id='body-wrapper-full']/descendant::*/div[contains(@class,'bldr-container')]/div[@class='webs-#{modulename}']").text.should include(context)
          end
       end
    end
   end  
end          
          


