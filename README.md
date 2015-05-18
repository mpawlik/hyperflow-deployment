hyperflow-deployment
====================

Chef scripts for deployment of hyperflow components and applictions

Installation:
-------------

Install on your Linux laptop :

Use git to download these scripts, use `--recursive` to download all dependent cookbooks linked as submodules.

`git clone --recursive https://github.com/malawski/hyperflow-deployment.git`


Assumptions:
------

These scripts assume you have an SSH access to a node (server, EC2 instance) with fresh OS installed. 

Currently tested OS is Ubuntu 14.04, see:  http://cloud-images.ubuntu.com/trusty/current/

Usage:
--------------

*Option 1*: Run from your laptop:

`./deploy.sh [attributes_file.json] [<user@>host]`

  * `[attributes_file.json]` is a configuration file for chef-solo and should include the required attributes and recipes.

  * `[<user@>host]` is the addres of the server you have SSH access to

See examples of these configuration files at `attributes` directory.

Edit attribute values to set `AMQP_URL`, `AWS_ACCESS_KEY_ID` or `AWS_SECRET_ACCESS_KEY` for the AMQP executor.

*Option 2*: Run on the node:

On Ubuntu 14.04:

`sudo apt-get -y install git`

`git clone --recursive https://github.com/malawski/hyperflow-deployment.git`

`cd hyperflow-deployment/`

`sudo bash install.sh attributes/hyperflow-onenode.json`

Or a one-liner: 

`sudo apt-get -y install git && git clone --recursive https://github.com/malawski/hyperflow-deployment.git && cd hyperflow-deployment/ && sudo bash install.sh attributes/hyperflow-onenode.json`

Usage example:
--------------

To deploy a master node with hyperflow engine and RabbitMQ:

`./deploy.sh attributes/hyperflow-master.json ubuntu@ec2-54-220-39-15.eu-west-1.compute.amazonaws.com`

To deploy the hyperflow worker node with AMQP executor and montage binaries:

`./deploy.sh attributes/hyperflow-worker.json ubuntu@ec2-54-220-39-15.eu-west-1.compute.amazonaws.com`

To deploy the hyperflow engine with MD Application:

`./deploy.sh attributes/hyperflow-md-worker.json ubuntu@ec2-54-220-39-15.eu-west-1.compute.amazonaws.com`

To run the MD workflow:

```
ssh ubuntu@ec2-54-220-39-15.eu-west-1.compute.amazonaws.com
cd MolecularDynamicsParameterStudy/
/node_modules/hyperflow/bin/hflow run md_1.json
```

Usage example: Molecular Dynamics with AMQP Executor 
--------------

On a fresh Amazon Ubuntu 14.04:

```
sudo apt-get -y install git && git clone --recursive https://github.com/malawski/hyperflow-deployment.git && cd hyperflow-deployment/ && sudo bash install.sh attributes/executor.json
cd hyperflow-deployment/ && sudo bash install.sh attributes/md.json
```

Restart the daemon:

`sudo THREADS=1 AMQP_URL=amqp://52.17.90.218 AWS_ACCESS_KEY_ID=AKIXXXXXXXXXXXXX AWS_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYYYYYYYYYYYY /etc/init.d/hyperflow-amqp-executor restart`


See tutorial of chef-solo at: http://www.opinionatedprogrammer.com/2011/06/chef-solo-tutorial-managing-a-single-server-with-chef/
