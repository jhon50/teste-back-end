RSpec.describe 'routes for Requests', :type => :routing do
  it 'routes /create to the requests controller' do
    expect(:post => 'requests').to route_to(:controller => 'requests', :action => 'create')
  end
end