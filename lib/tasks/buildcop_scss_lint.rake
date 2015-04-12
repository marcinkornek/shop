namespace :buildcop do
  desc 'Run "scss-lint"'
  task :'scss-lint' do
    require 'scss_lint'
    require 'scss_lint/cli'

    begin
      SCSSLint::CLI.new.run(%w(app/assets/stylesheets -c config/buildcop/.scss-lint.yml))
    rescue SystemExit
      abort('scss-lint failed!') unless ENV['FAIL_ON_ERROR'].nil?
    end
  end
end
