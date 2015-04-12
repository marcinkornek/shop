namespace :buildcop do
  desc 'Run "coffeelint"'
  task :coffeelint do
    require 'coffeelint'

    %w(app spec).map do |dir|
      Coffeelint.run_test_suite(dir, config_file: 'config/buildcop/coffeelint.json')
    end.all? || (abort('CoffeeLint failed!') unless ENV['FAIL_ON_ERROR'].nil?)
  end
end
