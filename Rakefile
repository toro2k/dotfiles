require 'pathname'

desc('install dotfiles package')
task(:install, [:package]) do |_, args|

  package_name = args[:package]

  unless package_dir_exist?(package_name)
    abort( error("#{package_name}: no such package") )
  end

  package_files = package_files(package_name)

  package_links(package_files).zip(package_files).each do |link, target|
    if not (link.exist? || link.symlink?)
      puts( success("#{link} -> #{target}") )
    else
      puts(error_message_for(link))
      puts( warning("#{link} -> #{target}") ) if ask_to_force?
    end
  end

end


def package_dir_exist?(package_name)
  Pathname.new(package_name).directory?
end

def package_files(package_name)
  Pathname.glob( Pathname.new(package_name).realpath.join('*') )
end

def package_links(package_files)
  home_dir = Pathname.new(ENV['HOME']).realpath
  package_files.map do |path|
    Pathname.new(home_dir.join(".#{path.basename}"))
  end
end


def ask_to_force?
  print("force? [y/N]")
  $stdin.getc.downcase == 'y'
end


def error_message_for(link)
  if link.exist?
    color(:red, "File or directory exists: #{link}")
  elsif link.symlink? && link.exist?
    "#{error('Link exists')}: #{link} -> #{link.readlink}"
  elsif link.symlink?
    color(:red, "Broken link: #{link} -> #{link.readlink}")
  else
    puts('unknown error')
  end
end

COLORS = {
  :red => "\e[01;31m",
  :green => "\e[01;32m",
  :yellow => "\e[01;33m",
  :reset => "\e[0m"
}

def success(text)
  color(:green, text)
end

def warning(text)
  color(:yellow, text)
end

def error(text)
  color(:red, text)
end


def color(color, text)
  "#{COLORS[color]}#{text}#{COLORS[:reset]}"
end
