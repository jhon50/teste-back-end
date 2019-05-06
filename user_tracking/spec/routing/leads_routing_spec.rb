RSpec.describe 'routes for Leads', :type => :routing do
  it 'routes /create to the leads controller' do
    expect(:post => 'requests').to route_to(:controller => 'requests', :action => 'create')
  end
end