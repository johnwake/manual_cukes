$:.unshift(File.dirname(__FILE__))
require 'patches'

def ask_question
  ask('Current step correct? [y|n]').chomp
end

