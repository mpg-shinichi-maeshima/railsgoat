# RailsGoat

RailsGoat is a vulnerable version of the Ruby on Rails Framework from versions 3 to 5. It includes vulnerabilities from the OWASP Top 10, as well as some "extras" that the initial project contributors felt worthwhile to share. This project is designed to educate both developers, as well as security professionals.

## Docker Install
To run Railsgoat with Docker you must first have [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/) installed. Once those dependencies are installed, cd into the Railsgoat directory where you've cloned the code and run. Rails requires Compose **1.6.0** or above and require a Docker Engine of version **1.10.0** or above.

```
#~/code/railsgoat
$ docker-compose build
$ docker-compose run web rails db:setup
$ docker-compose up
...
  Creating railsgoat_web_1
  Attaching to railsgoat_web_1
```
Once you see the preceeding message Railsgoat is running on your localhost on port 3000.

Open your favorite browser, navigate to `http://localhost:3000` and start hacking!

Note: if your container exits with an error, it may be because a server is already running:
```
A server is already running. Check /myapp/tmp/pids/server.pid.
=> Booting Thin
=> Rails 5.0.1 application starting in development on
http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
Exiting
```
In this case, remove that server.pid file and try again. Note also that this file is in your current working directory, not inside the container.

## Capybara Tests

RailsGoat now includes a set of failing Capybara RSpecs, each one indicating that a separate vulnerability exists in the application. Simply run the following task:

```
$ docker-compose exec web rails training
```

To run just one spec:

```
$ docker-compose exec web rails training SPEC=spec/vulnerabilities/sql_injection_spec.rb
```

# License

[The MIT License (MIT)](./LICENSE.md)
