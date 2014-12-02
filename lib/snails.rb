require "snails/version"

module Snails
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
        ["You're Riding Ruby on Snails!"]]
    end
  end
end
