require_relative 'strategy/sql_analyzer'
require_relative 'strategy/counter'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.register_strategy(:sql_analyzer, SqlAnalyzer)
  FactoryGirl.register_strategy(:counter, Counter)
end
