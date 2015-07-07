require 'pathname'
require 'io/console'
require 'erb'
require 'yaml'
require 'pp'


desc('install dotfiles package')
task(:install, [:package] => :generate) do |_, args|

  package_files = get_package_files(args[:package])
  package_links = get_package_links(package_files)

  package_links.zip(package_files) do |link, target|

    if link.exist? || link.symlink?

      if link.symlink?
        print("#{error('Link exists:')} #{link} -> #{link.readlink}")
      else
        print("#{error('File or directory exists:')} #{link}")
      end

      if ask_to_remove?
        puts("#{warning('delete')} #{link}")
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

  package_conf = Pathname(args[:package]).realpath.join('package_config.yml')

  if package_conf.exist?
    package_erbs = get_package_erbs(args[:package])
    package_gens = get_package_gens(package_erbs)
    generator = Generator.new( YAML.load(package_conf.read) )

    package_erbs.zip(package_gens) do |erb, gen|
      template = ERB.new(erb.read())
      output = template.result(generator.get_binding)
      gen.write(output)
    end
  end

end


task(:check_package, [:package]) do |_, args|
  unless Pathname(args[:package]).directory?
    abort( error("#{args[:package]}: no such package") )
  end
end

task(:find_generated_files) do
  Pathname.glob('**/*.erb').each do |erb|
    puts(erb.dirname.join(erb.basename('.erb')))
  end
end

def get_package_files(package_name)
  files = Pathname.glob( Pathname(package_name).realpath.join('*') )
  files.delete_if { |p| p.extname == '.erb' }
end

def get_package_links(package_files)
  package_files.map do |path|
    Pathname.new(Pathname(ENV['HOME']).join(".#{path.basename}"))
  end
end

def get_package_erbs(package_name)
  Pathname.glob( Pathname(package_name).realpath.join('**/*.erb') )
end

def get_package_gens(package_erbs)
  package_erbs.map do |p|
    p.dirname.join(p.basename('.erb'))
  end
end


def ask_to_remove?
  print(" remove? [y/N]")
  remove = $stdin.getch.downcase == 'y'
  puts
  remove
end

class Generator

  def initialize(config)
    @config = config
  end

  def method_missing(m, *args)
    if @config.key?(m.to_s)
      @config[m.to_s]
    else
      super
    end
  end

  def get_binding
    binding
  end
end


COLORS = {
  :red => "[01;31m",
  :green => "[01;32m",
  :yellow => "[01;33m",
  :reset => "[0m"
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
