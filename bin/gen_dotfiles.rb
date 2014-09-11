#!/usr/bin/env ruby

require 'pathname'
require 'erb'
require 'yaml'


dotfiles_path = Pathname.new('~/dotfiles').expand_path
template_paths = Pathname.glob(dotfiles_path.join('**/*.erb'), File::FNM_DOTMATCH)
config_path = Pathname.new('~/.dotfiles').expand_path


unless dotfiles_path.directory?
  warn "#{dotfiles_path}: no such directory"
  exit 1
end

unless config_path.file?
  warn "#{config_path}: no such file"
  exit 1
end


$config = YAML.load(config_path.open.read)
alias good_old_method_missing method_missing
def method_missing(m, *a)
  if $config.key?(m.to_s)
    $config[m.to_s]
  else
    good_old_method_missing(m, *a)
  end
end


template_paths.each do |path|
  result = ERB.new(path.read).result
  output_path = path.dirname.join(path.basename('.erb'))
  output_path.write(result)
end
