class UpdateUrl < ActiveRecord::Migration[6.0]
  def up
    Task.reset_column_information
    Task.find_each do |task|
      task.update_column(:url, Hash[task.url_temp.each_with_index.map { |value, index| [index, value] }])
    end
  end
end
