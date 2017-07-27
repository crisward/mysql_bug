require "./spec_helper"

describe "MysqlBug" do
  it "it should be able to get 5 rows" do
    rows = [] of String
    (0...5).each do
      rows << get_row
    end
    rows.size.should eq(5)
  end

  it "it should be able to get rows after 3 exceptions" do
    (0...5).each do
      get_error
    end
    get_row.should eq("Tom")
  end
end
