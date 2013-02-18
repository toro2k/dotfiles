IRB.conf[:USE_READLINE] = true

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'], '.irb-history')

IRB.conf[:AUTO_INDENT] = true
