namespace :buildcop do
  require 'flay_task'

  desc 'Run "flay"'
  FlayTask.new do |task|
    task.verbose   = true
    task.dirs     -= ['spec']
    task.threshold = ENV['FAIL_ON_ERROR'].nil? ? Float::INFINITY : 500 # TODO: Change to smaller number
  end
end
