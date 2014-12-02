require "snails/version"
require "snails/routing"

module Snails
  class Application
    def call(env)
      #temp hack to keep app from barfing when it
      #can't find a favicon
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue
        text = "That didn't work! Sorry"
      end

      [200, {'Content-Type' => 'text/html'},
        [text]] 
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env 
      @env
    end 
  end

end
