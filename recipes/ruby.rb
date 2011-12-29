# Ruby
package :ruby do
  description "Ruby 1.9.2-p290"
  version = '1.9.2-p290'
  apt %w(bison openssl libreadline6 libreadline6-dev curl libssl-dev libyaml-dev 
         libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev autoconf)
         
  source "http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{version}.tar.gz" do
    post :install, "gem update --system"
    post :install, "gem install bundler"
  end

  verify { 
    has_executable 'ruby'
    has_executable 'gem'
    has_gem "bundler"
  }
end