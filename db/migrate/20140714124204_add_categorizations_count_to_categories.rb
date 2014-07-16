class AddCategorizationsCountToCategories < ActiveRecord::Migration
  def up
    add_column :categories, :categorizations_count, :integer, :default => 0
		Category.reset_column_information
		Category.all.each do |c|
			c.update_attribute :categorizations_count, c.categorizations.count
		end
  end

	def down
		remove_column :categories, :categorizations_count
	end
end
