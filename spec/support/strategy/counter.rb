class Counter
  def initialize
    @strategy = FactoryGirl.strategy_by_name(:build).new
  end

  delegate :association, to: :@strategy

  def result(evaluation)
    record = @strategy.result(evaluation)
    {record.class.table_name => 1}.merge(
      Hash[record._reflections.map{ |k, v|
        [v.plural_name, Array.wrap(record.send(k)).compact.size]
      }]
    )
  end
end