hyperflow-deployment
====================

Chef scripts for deployment of hyperflow components and applictions

Installation:
-------------

Use git to download these scripts, use `--recursive` to download all dependent cookbooks linked as submodules.

`git clone --recursive https://github.com/malawski/hyperflow-deployment.git`


Usage:
--------------

`./deploy.sh [attributes_file.json] [<user@>host]`

`[attributes_file.json]` is a configuration file for chef-solo and should include the required attributes and recipes.

See examples of these configuration files at `attributes` directory.

Edit attribute values to set `AMQP_URL`, `AWS_ACCESS_KEY_ID` or `AWS_SECRET_ACCESS_KEY` for the AMQP executor.

Usage example:
--------------

To deploy a master node with hyperflow engine and RabbitMQ:

`./deploy.sh attributes/hyperflow-master.json ubuntu@ec2-54-220-39-15.eu-west-1.compute.amazonaws.com`

To deploy the hyperflow worker node with AMQP executor and montage binaries:

`./deploy.sh attributes/hyperflow-worker.json ubuntu@ec2-54-220-39-15.eu-west-1.compute.amazonaws.com`


See tutorial of chef-solo at: http://www.opinionatedprogrammer.com/2011/06/chef-solo-tutorial-managing-a-single-server-with-chef/
