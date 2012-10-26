Given /^.*$/ do
  answer = ask_question
  until answer =~ /^(y|yes|n|no)$/
    print "Please answer y or n\n"
    answer = ask_question 
  end
  answer.should =~ /y|yes/
end
