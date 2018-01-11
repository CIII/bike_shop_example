class SqlAnalyzer
  def initialize
    @strategy = FactoryGirl.strategy_by_name(:build).new
  end

  delegate :association, to: :@strategy

  def result(evaluation)
    record = @strategy.result(evaluation)
    obj_associations(record).unshift(record).map { |obj|
      "#{obj.class.arel_table.create_insert.tap { |im|
        im.insert(obj.send(:arel_attributes_with_values_for_create, obj.attribute_names))
      }.to_sql};"
    }
  end

  def obj_associations(record)
    record._reflections.keys.flat_map{|k| record.send(k)}.compact
  end
end