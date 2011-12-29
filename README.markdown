# Rails stack, zero to hero in under five minutes

## How to get your sprinkle on:

* Get a brand spanking new slice / host (Debian or Ubuntu please, other apt-based sytems might work too)
* Install sudo if you are on Debian
* Create yourself a user (use `adduser`), add yourself to the /etc/sudoers file
* Set your host url|ip address and some fields with databae in settings.yml (settings.yml.example provided)

From your local system (from the passenger-stack directory), run:

    sprinkle -c -s config/install.rb

After you've waited for everything to run, you should have a provisioned slice.
Go forth and install your custom configurations, add vhosts and other VPS paraphernalia.

## Wait, what does all this install?

* Nginx (Source)
* Ruby 1.9.2-p290 (Source) [includes rubygems]
* Passenger (Rubygem)
* MySQL (Apt)
* MySQL ruby database drivers (Rubygem)
* Git (Apt)

## Requirements
* Ruby
* Capistrano
* Sprinkle (github.com/crafterm/sprinkle)
* An Ubuntu or Debian based VPS

## Disclaimer

Don't run this on a system that has already been deemed "in production", its not malicious, but there is a fair chance that you'll ass something up monumentally. You have been warned. 