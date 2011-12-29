# Nginx + Passenger
package :nginx do
  description "Nginx Web Server installed by Passenger"
  version = '1.0.11'
  
  $settings = YAML.load_file(File.join(File.dirname(__FILE__), "..", "/settings.yml"))
  
  noop do
    pre :install, "sudo passenger-install-nginx-module --auto --auto-download --prefix=#{$settings['install']['prefix']}/nginx"

    post :install, "wget https://raw.github.com/raecoo/rails-stack/master/assets/nginx -P /etc/init.d"
    post :install, "sudo chmod +x /etc/init.d/nginx"
    post :install, "sudo /usr/sbin/update-rc.d -f nginx defaults"
    post :install, "sudo /etc/init.d/nginx start; true"
    post :install, "sudo /etc/init.d/nginx reload"
  end
  
  requires :passenger
  verify {
    has_file "/etc/init.d/nginx"
  }
   
end

package :passenger, :provides => :app_server do
  description 'Phusion Passenger (mod_rails)'
  version = '3.0.11'
  gem 'passenger'
  
  requires :ruby
  verify {
    has_gem "passenger", version
  }
end