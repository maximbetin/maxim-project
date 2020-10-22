# When containers are created from this image, it will run Terraform
FROM alpine

MAINTAINER Maxim Betin <betinmaxim@gmail.com>

# wget to download Terraform, save in /tmp in Linux and unzip it into root dir
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /

# For HTTPS access to Terraform Registry
RUN apk add --no-cache ca-certificates curl

# Different user for this container to run us to avoid running as root for security reasons;
# "nobody" has no privileges except some executions
#USER nobody

# Entrypoint for running the container's application
ENTRYPOINT [ "/terraform" ]
