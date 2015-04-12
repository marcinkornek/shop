desc 'Run all "buildcop" code analyzers'
task :buildcop do
  %w(rubocop brakeman coffeelint scss-lint jslint-v8 flay simplecov).each do |name|
    Rake.application.lookup("buildcop:#{name}").try(:invoke)
  end
end
