IRB.conf[:USE_READLINE] = true

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'], '.irb-history')

IRB.conf[:AUTO_INDENT] = true

IRB.conf[:PROMPT][:VERSION] = {
  :PROMPT_I => "#{RUBY_VERSION}> ",
  :PROMPT_S => "#{RUBY_VERSION}%l ",
  :PROMPT_C => "#{RUBY_VERSION}* ",
  :RETURN   => "# => %s\n"
}
IRB.conf[:PROMPT_MODE] = :VERSION
