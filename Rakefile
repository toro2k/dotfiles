require 'erb'
require 'find'
require 'set'
require 'yaml'

CONFIG_FILE_NAME = 'config.yml'

class ConfigMissingError < NameError;
  def initialize(name)
    super('', name)
  end
end

class GenContext


  def initialize(gen, erb)
    @gen, @erb = gen, erb
    @config = YAML.load(File.read(CONFIG_FILE_NAME))
  end

  def generate
    erb = ERB.new(File.read(@erb))
    File.write(@gen, erb.result(binding))
  end

  def method_missing(method)
    section = @config[@gen]
    raise ConfigMissingError.new(@gen) if section.nil?

    config = section[method.to_s]
    raise ConfigMissingError.new("#{@gen}/#{method}") if config.nil?

    config
  end
end

def find_erbs
  erb_paths = []
  Find.find('.') do |path|
    erb_paths << path if File.extname(path) == '.erb'
  end
  erb_paths.map! { |p| p[2..-1] } # Strip leading ./
  erb_paths
end

def erbs_to_gens(erbs)
  erbs.map { |p| p.chomp('.erb') }
end

erb_paths = find_erbs
gen_paths = erbs_to_gens(erb_paths)

task :default => gen_paths

gen_paths.zip(erb_paths).each do |gen, erb|
  desc "<- #{erb}"
  file gen => erb do
    begin
      GenContext.new(gen, erb).generate
    rescue Errno::EACCES => ex
      puts ex.message
    rescue ConfigMissingError => ex
      puts "Undefined variable #{ex.name}"
    end
  end
end


task :gitignore do
  ignored = File.readlines('.gitignore').map(&:strip).to_set
  gens = erbs_to_gens(find_erbs)
  gens.reject! { |g| ignored.include?(g) }
  gens.each { |g| puts g }
end
