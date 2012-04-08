class RulesController < ApplicationController
   def index
     render 'Hello World'
   end
   
   def random
     @rule = Rule.with_state(:approved).random
   end
end
