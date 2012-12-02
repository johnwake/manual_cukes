$:.unshift(File.dirname(__FILE__))
require 'patches'

def ask_question
  ask('Current step correct? [y|n]').chomp
end

def failing_step
  ask('Please enter issue').chomp
  STDOUT.flush
  gets.chomp
end
