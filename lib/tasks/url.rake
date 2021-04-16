namespace :url do
  task :update_url => :environment do
    desc 'save data for field url in tasks'
    Task.reset_column_information
    Task.find_each do |task|
      task.update_column(:url, Hash[task.url_temp.each_with_index.map { |value, index| [index, value] }])
    end
  end
end