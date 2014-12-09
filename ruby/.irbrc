puts "Loading Jake's irb for #{Dir.pwd}..."

require 'rubygems'

require 'irb/completion' # for autocompletion
require 'what_methods' # use as 3.45.what? 3 (ie, "what method should I call to get this result")
require 'pp' # pretty print
require 'net-http-spy' # Print information about any HTTP requests being made

# configure irb
#IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")


# Enable colored output
require 'wirble'
Wirble.init
Wirble.colorize

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

module DynamicPrompt
  def self.apply!
    IRB.conf[:PROMPT][:INFORMATIVE] = {
        :PROMPT_I => ">>".tap {|s| def s.dup; gsub('>>', DynamicPrompt.normal); end },
        :PROMPT_S => "\e[0;35m%n\e[0m   ",
        :PROMPT_C => "\e[0;35m%n\e[0m>   ",
        :RETURN => "\e[1;35m=>\e[0m %.2048s\n"
    }
    IRB.conf[:PROMPT_MODE]  = :INFORMATIVE
  end

  def self.normal
    color1 = "\e[0;35m%n \e[35m[\e[1;35m"
    color2 = "\e[0;35m]::\e[1;34m"
    color3 = "\e[0;35m]\e[0m>"
    color1 + current_ruby + color2 + cwd + color3
  end

  private
  def self.current_ruby
    @@current_ruby ||= `rvm current`.strip
  end

  def self.cwd
    if Dir.pwd == '/'
      '/'
    elsif Dir.pwd == ENV['HOME']
      '~'
    else
      Dir.pwd.split('/').last
    end
  end

end

DynamicPrompt.apply!

