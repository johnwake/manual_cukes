require 'cucumber/formatter/html'
require 'cucumber/formatter/console'
require 'cucumber/formatter/pretty'

module Cucumber
  module Formatter

    module Console

      # Hack - prevents user input appearing in passing test steps
      def print_messages
      end

    end

    class Pretty

      def before_step(step)
        text = "#{step.keyword} #{step.name}\n"
        print "\033[33m#{text}\033[0m"
        @current_step = step #should be able to alias old for new but got horrible recursion
        @indent = 6
      end

    end

    class Html

      # Dirty hack but saves implementing an entire custom formatter
      CUSTOM_MARKUP = "<div id='header' style='background: blue; height: 6em; color: white'><h1>ITV - #{ENV['PROJECT']} - #{Time.now.strftime('%d/%m/%y-%H:%M:%S')}</h1></div>"

      # Hack - prevents user input appearing in passing test steps
      def print_messages
        empty_messages
      end

      def before_features(features)
        @step_count = get_step_count(features)

        # <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        @builder.declare!(
            :DOCTYPE,
            :html,
            :PUBLIC,
            '-//W3C//DTD XHTML 1.0 Strict//EN',
            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'
        )

        @builder << '<html xmlns ="http://www.w3.org/1999/xhtml">'
        @builder.head do
          @builder.meta(:content => 'text/html;charset=utf-8')
          @builder.title 'Cucumber'
          inline_css
          inline_js
        end
        @builder << '<body>'
        @builder << "<!-- Step count #@step_count-->"
        @builder << '<div class="cucumber">'
        @builder << CUSTOM_MARKUP
        @builder.div(:id => 'cucumber-header') do
          @builder.div(:id => 'label') do
            @builder.h1('Cucumber Features')
          end
          @builder.div(:id => 'summary') do
            @builder.p('', :id => 'totals')
            @builder.p('', :id => 'duration')
            @builder.div(:id => 'expand-collapse') do
              @builder.p('Expand All', :id => 'expander')
              @builder.p('Collapse All', :id => 'collapser')
            end
          end
        end
      end

    end
  end
end
