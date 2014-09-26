#!/usr/bin/ruby -W

require 'pathname'
require 'yaml'
require 'optparse'


XRANDR = '/usr/bin/xrandr'.freeze
DEFAULT_CONFIG_PATH = Pathname.new('~/.autorandr').expand_path.freeze


def split_mode(mode_str)
  mode_str.scan(/(\d+)x(\d+)/).flatten.map(&:to_i)
end


def parse_connected_output(line)
  tokens = line.split(nil, 4)

  output = {}
  output[:name] = tokens[0]
  output[:modes] = []

  if tokens[2] == 'primary'
    output[:on] = true
    output[:primary] = true
    output[:mode] = split_mode(tokens[3])
  elsif tokens[2] =~ /\A[1-9]/
    output[:on] = true
    output[:primary] = false
    output[:mode] = split_mode(tokens[2])
  else
    output[:on] = false
  end

  output
end

def parse_mode_line(line)
  mode_str, _ = line.split(nil, 2)
  split_mode(mode_str)
end

def parse_xrandr_query
  IO.popen(XRANDR).each.with_object([]) do |line, outputs|
    case line
    when /\AScreen/ # header
      next
    when /\A[A-Z]/ # output line
      next if line.include?('disconnected')
      outputs << parse_connected_output(line)
    else # mode line
      outputs.last[:modes] << parse_mode_line(line)
    end
  end
end


def command_options_for(output, args)
  options = []
  options << '--output'
  options << output[:name]
  if args[:mode] && output[:modes].include?(split_mode(args[:mode]))
    options << '--mode'
    options << args[:mode]
  else
    options << '--auto'
  end
  options
end

def switch_outputs(outputs, config)
  command_line = [XRANDR]

  config.each do |output_name, args|
    output = outputs.find { |o| o[:name] == output_name }
    if output
      command_line.concat(command_options_for(output, args))
    else
      warn "WARNING: output #{output_name} is not connected"
      next
    end
  end

  if command_line.size == 1
    command_line << '--output'
    command_line << outputs.first[:name]
    command_line << '--auto'
  end

  p command_line
  system(*command_line)
end

def print_outputs(outputs)
  outputs.each do |out|
    puts out[:on] ? "[#{out[:name]}]" : out[:name]

    out[:modes].each do |mode|
      mode == out[:mode] ? print('* ') : print('  ')
      puts mode.join('x')
    end
  end
end


def read_config(config_path)
  if config_path.readable?
    config = YAML.load(config_path.read)
    return config if config
  end
  {}
end



outputs = parse_xrandr_query
config_path = DEFAULT_CONFIG_PATH

OptionParser.new do |opts|

  opts.banner = "Usage: #{$0} [options]"

  opts.on('-l', 'List connected outputs') do
    print_outputs(outputs)
    exit 0
  end

  opts.on('-f FILE', 'Read config from FILE') do |path|
    path = Pathname.new(path).expand_path
    if path.readable?
      config_path = path
    else
      warn "WARNING: cannot read config from #{path}, using default configuration file"
    end
  end

end.parse!

switch_outputs(outputs, read_config(config_path))
