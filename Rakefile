require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'

Cucumber::Rake::Task.new(:cucumber) do |task|
  ENV['PROJECT'] ||= "UnknownProject"
  report_title = "#{ENV['PROJECT']}_#{Time.now.strftime('%d-%m-%y-%H:%M:%S')}_report.html"
  task.cucumber_opts = "-f pretty -f html --out #{report_title}"
end

task :default => :cucumber
