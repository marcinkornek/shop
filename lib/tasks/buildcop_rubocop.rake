namespace :buildcop do
  require 'rubocop/rake_task'

  desc 'Run "rubocop"'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.fail_on_error = ENV['FAIL_ON_ERROR'] == 'true'
    task.options = %w(--display-cop-names --fail-level convention --config .rubocop.yml)
  end
end
