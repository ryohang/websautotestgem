module Websautotest
  module CommonPageOperation
    def initialize(session)
      @session = session
    end
    
    def current_url
      @session.current_url
    end
    
    def visit_redirect(url)
      @session.visit url
    end
 end
end