require 'rails_helper'

describe Bike do
  before(:all) do
    @sql = FactoryGirl.sql_analyzer(:bike)
    @counter = FactoryGirl.counter(:bike)
  end

  it "should run correct sql statements in bike transaction" do
    @counter.keys.each{ |k|
      expect(@sql.count{|qry| qry.include?("INSERT INTO \"#{k}\"")}).to eq(@counter[k])
    }
  end

  it "should build bike and associations correctly" do
    expect(@counter).to include({
      "bikes" => 1,
      "stores" => 0,
      "wheels" => 2,
      "gears" => 2,
      "accessories" => 3,
      "frames" => 1,
      "chains" => 1,
      "seats" => 1,
      "helmets" => 0
    })
  end
end