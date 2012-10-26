require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'

Cucumber::Rake::Task.new(:cucumber) do |task|
  project = ENV['PROJECT'] ? "#{ENV['PROJECT']}_" : 'Unknown Project'
  report_title = "#{project}#{Time.now.strftime('%d-%m-%y-%H:%M:%S')}_report.html"
  task.cucumber_opts = "-f pretty -f html --out #{report_title}"
end

task :default => :cucumber
