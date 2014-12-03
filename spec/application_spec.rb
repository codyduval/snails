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

  it "parses env to get path info", :focus => true do
    request '/test/test'
    env = last_request.env
    expect(env["PATH_INFO"]).to eq("hello") 
  end

  it "routes to a path" do
    get '/test/test'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Roger That") 
  end


end


