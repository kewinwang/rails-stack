# Fill slice_url in - where you're installing your stack to
role :app, $settings['install']['host']

# Fill user in - if remote user is different to your local user
set :user, $settings['install']['user']
set :password, $settings['install']['password']

default_run_options[:pty] = true
