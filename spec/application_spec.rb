class TestApp < Snails::Application
end

class TestController < Snails::Controller
  def test
    "Roger That"
  end
end
  
describe Snails::Application do

  def app
    TestApp.new
  end

  it "routes to a path" do
    get '/test/test'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Roger That") 
  end

  it "parses the env hash", :focus => true do
    request '/test/test'
    expect(rack_env).to eq("hello") 
  end

end


