# maxim-terraform WiP

This is a demo website called `explorecalifornia.org` on which I run tests, upload to AWS S3 and run a CI/CD pipeline with Jenkins, all using Docker Compose.

## Testing with RSpec, Capybara and Selenium

The idea is that when `docker-compose` is spun up, Selenium will start, Chrome will start and Capybara will run tests against the demo website. RSpec is a Ruby-based testing framework. Capybara is a tool that let's you use something called a web driver to create a browser and interact with the website. Selenium is a web driver that spins up a real web browser and tests against whatever the web browser sees

- Spin up the website and Selenium:

`docker-compose up -d website selenium`

- Run the tests on the website with RSpec:

`docker-compose run --rm unit-tests`

Rspec is a testing framework for Ruby. Ruby is a programming language. Capybara is a Ruby framework for interacting with browsers. Selenium automates browser activity.

## Infrastructure as Code with Terraform

When it comes to deploying the website to a production-like environment, Configuration Managers such as Chef or Ansible are candidates that can achieve this as they also provision infrastructure. The problem is saving state, saving changes over time. And because we're interested in running this in AWS, that can happen pretty easily depending on permissions that people have within AWS, and what other people do within that environment, it can get pretty complicated. So we want a tool that allows us to provision infrastructure easily, and also keep track of that infrastructure, and the way that we do that is through Terraform. Terraform is written in Golang, and applications written in Go are packaged as a single executable. The website will be uploaded to an AWS S3 bucket that will serve it as static content.

- Build Terraform's image:

`docker-compose build terraform`

- Initialize a working directory containing Terraform configuration files:

`docker-compose run --rm terraform init`

- Preview the state (to create an execution plan):

`docker-compose run --rm terraform plan`

- Apply the changes required to reach the desired state of the configuration:

`docker-compose run --rm terraform apply`

- Copy the website into the S3 bucket (bucket names are globally unique just like in GCP):

`docker-compose run --rm --entrypoint aws aws s3 cp --recursive website/ s3://maximexplorecalifornia.org`.

- Extract the value of the output variable from the state file to see the URL:

`docker-compose run --rm terraform output`

- Run the integration test; the particular integration test verifies that the website is indeed deployed to the Internet as well, not just locally:

`docker-compose run --rm integration-tests`

- Once done, delete the S3 bucket and its contents (you won't be able to delete the bucket through Terraform directly):

`docker-compose run --rm --entrypoint aws aws s3 rm s3://maximexplorecalifornia.org/ --recursive`

- Now Terraform can be used to destroy the infrastructure (Terraform will look at the state first):

`docker-compose run --rm terraform destroy`

Terraform will look for the state file to see what was created before and compare against what we have locally and what provisioning differences we need to make. It tracks the information in the file. When you change your Terraform file, it knows what needs to be created or destroyed. 


