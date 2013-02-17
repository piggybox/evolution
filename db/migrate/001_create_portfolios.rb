class CreatePortfolios < ActiveRecord::Migration
  def self.up
    create_table :portfolios do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :portfolios
  end
end
