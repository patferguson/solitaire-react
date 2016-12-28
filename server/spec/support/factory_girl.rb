# Initialises and pulls in all FactoryGirl methods, included in rails_helper
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
