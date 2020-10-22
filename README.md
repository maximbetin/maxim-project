# maxim-terraform WiP

## Testing with RSpec, Capybara and Selenium

The idea is that when docker-compose is spun up, Selenium will start, Chrome will start and Capybara will run tests against the demo website.

- Spin up the website and Selenium:

`docker-compose up -d website selenium`

- Run the tests on the website with RSpec:

`docker-compose run --rm unit-tests`

Rspec is a testing framework for Ruby. Ruby is a programming language. Capybara is a Ruby framework for interacting with browsers. Selenium automates browser activity.
