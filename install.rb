require 'yaml'

# Loading packages.
Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'recipes', '*.rb')].each do |package|
  require package
end

$settings = YAML.load_file(File.join(File.dirname(__FILE__), "assets", "settings.yml"))

# What we're installing to your server Take what you want, leave what you don't
# Build up your own and strip down your server until you get it right. 
policy :stack, :roles => :app do
  requires :init
  requires :ruby           # Ruby 1.9.2-p290                             
  requires :nginx          # Nginx + Passenger                         
  requires :mysql          # MySQL with ruby client gem for it
end

deployment do
  # mechanism for deployment
  delivery :capistrano do
    begin
      recipes 'Capfile'
    rescue LoadError
      recipes 'deploy'
    end
  end
 
  # source based package installer defaults
  source do
    prefix    $settings['install']['prefix']
    archives  $settings['install']['archives']
    builds    $settings['install']['builds']
  end
end

# Depend on a specific version of sprinkle 
begin
  gem 'sprinkle', ">= 0.2.3" 
rescue Gem::LoadError
  puts "sprinkle 0.2.3 required.\n Run: `sudo gem install sprinkle`"
  exit
end