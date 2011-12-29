# MySQL
package :mysql, :provides => :database do
  description "MySQL Database"
  $settings = YAML.load_file(File.join(File.dirname(__FILE__), "../assets", "settings.yml"))
  
  apt %w( mysql-server mysql-client mysql-common libmysqlclient16 libmysqlclient-dev ) do
    USER_NAME     = $settings['database']['user']
    USER_PASSWORD = $settings['database']['password']
    ROOT_PASSWORD = $settings['database']['root_password']
    post :install, "service mysql stop; true"
    post :install, "service mysql start"
    post :install, "mysqladmin -u root password #{ROOT_PASSWORD}"
    post :install, "echo 'GRANT ALL PRIVILEGES ON #{USER_NAME}.* TO #{USER_NAME}@'%' IDENTIFIED BY \"#{USER_PASSWORD}\";'"
  end
  
  verify {
    has_executable 'mysql'
  }
  requires :mysql_driver
end
 
package :mysql_driver do
  description 'Ruby MySQL database driver'
  gem 'mysql2'
  
  verify do
    has_gem 'mysql2'
  end
  
  requires :ruby
end
