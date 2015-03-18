require 'pathname'
require 'io/console'
require 'pp'


desc('install dotfiles package')
task(:install, [:package] => :generate) do |_, args|

  package_files = get_package_files(args[:package])
  package_links = get_package_links(package_files)

  package_links.zip(package_files) do |link, target|

    if link.exist? || link.symlink?

      if link.symlink?
        print( error("Link exists: #{link} -> #{link.readlink}") )
      else
        print( error("File or directory exists: #{link}") )
      end

      if ask_to_remove?
        puts( warning("delete #{link}") )
        if link.directory?
          link.rmtree
        else
          link.delete
        end
      else
        next
      end

    end

    link.make_symlink(target)
  end

end


task(:generate, [:package] => :check_package) do |_, args|

  # package_erbs = get_package_erbs(args[:package])

end


task(:check_package, [:package]) do |_, args|
  unless Pathname(args[:package]).directory?
    abort( error("#{args[:package]}: no such package") )
  end
end


def get_package_files(package_name)
  Pathname.glob( Pathname(package_name).realpath.join('*') )
end

def get_package_links(package_files)
  package_files.map do |path|
    Pathname.new(Pathname(ENV['HOME']).join(".#{path.basename}"))
  end
end

# def get_package_erbs(package_name)
#   erbs = Pathname.glob( Pathname.new(package_name).realpath.join('**/*.erb') )
# end


def ask_to_remove?
  print(" remove? [y/N]")
  remove = $stdin.getch.downcase == 'y'
  puts
  remove
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
