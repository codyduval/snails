class TestApp < Snails::Application
end

class TestController < Snails::Controller
  def test
    "Roger That"
  end
end

def app
  TestApp.new
end

def env
  last_request.env
end

describe "dependencies and module helpers" do

  it "snake_cases a camel cased string" do
    snake_cased = Snails.to_underscore('ThisIsCamelCased')

    expect(snake_cased).to eq('this_is_camel_cased')
  end

end

describe Snails::Controller do
  it "gets a controller and action from the path" do
    get '/test/test'
    klass_and_action = app.get_controller_and_action(env)

    expect(klass_and_action.first).to eq(TestController) 
    expect(klass_and_action.last).to eq("test") 
  end

  it "routes to a path" do
    get '/test/test'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Roger That") 
  end

end
  
describe Snails::Application do
  it "parses env to get path info" do
    request '/test/test'
    expect(env["PATH_INFO"]).to eq("/test/test") 
  end
end



