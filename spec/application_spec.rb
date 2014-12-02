class TestApp < Snails::Application
end
  
describe 'The HelloWorld App' do

  def app
    TestApp.new
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("You're Riding Ruby on Snails!")
  end
end
