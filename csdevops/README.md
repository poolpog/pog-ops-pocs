# POC for technical interview
This is a proof-of-concept I created to solve a solution for a technical interview. Unfortunately, I did not quite finish the solution and it is broken as-is.

Leaving it, though, for my own reference.

# Choose CIDR blocks for subnets

    for i in 0 1 2 3 ; do END=$(( 64 * i )); sipcalc 10.99.0.$END/26 | grep -E 'Host addr|Addresses|Network range'; echo "===";  done
    Host address		- 10.99.0.0
    Host address (decimal)	- 174260224
    Host address (hex)	- A630000
    Addresses in network	- 64
    Network range		- 10.99.0.0 - 10.99.0.63
    ===
    Host address		- 10.99.0.64
    Host address (decimal)	- 174260288
    Host address (hex)	- A630040
    Addresses in network	- 64
    Network range		- 10.99.0.64 - 10.99.0.127
    ===
    Host address		- 10.99.0.128
    Host address (decimal)	- 174260352
    Host address (hex)	- A630080
    Addresses in network	- 64
    Network range		- 10.99.0.128 - 10.99.0.191
    ===
    Host address		- 10.99.0.192
    Host address (decimal)	- 174260416
    Host address (hex)	- A6300C0
    Addresses in network	- 64
    Network range		- 10.99.0.192 - 10.99.0.255

# Set up CF Template
* VPC
* Subnets
* EC2 instances
    * Choose an image that is secure and has docker installed already
    * ubuntu-lts-18.04-base-1542848667 - ami-0d3537e1397cd4de5
* ELB
    * Point to docker containers on hosts

# Set up EC2 user-data on launch?
* Install docker
* pulls image from dockerhub 
* does docker run, with correct args

# Set up Postgres
* Use Free tier
* Master username
    * postgres
    * uc3jageecah1Ob7K

# Scripts
* deploy.sh
    * lists available deployable versions, lets you choose
    * OR, takes deploy version as an arg
    * deploys CF template with argument to next version

# Improvements

Several aspects are missing or need improvement

* Autoscaling
* Proper docker orchestration via Kubernetes or similar
* Deployment via a CI/CD system
* Dynamic or runtime parameters in Cloudformation (everything was hardcoded)
* Or an Autoscaling group
* Ensure no downtime aspect works
    * Re-running the CF template with new cloudinit user data to pull a new docker image **should** go through each instance one at a time and pull the new docker, leaving the other instance listening to requests; I don't know if CF does this automtically, but this can be resolved
* Add A-record Alias for the load balancer

