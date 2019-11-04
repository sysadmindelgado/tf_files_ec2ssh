# tf_files_ec2ssh
Terraform ec2 with ssh access templates

This requires that the binaries for aws command line, git command line and terraform be installed.

## Install aws for command line

yum install aws

## Configure aws command line with your access key and secret key (required by Terraform in our setup)

aws configure

## Install git for command line

yum install git

## Obtain terraform binary for Linux

cd /tmp
wget https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip
unzip terraform_0.12.13_linux_amd64.zip
mv terraform /usr/local/bin

## Use git command to obtain the Terraform templates in this repository
git clone https://github.com/sysadmindelgado/tf_files_ec2ssh.git

## Change directory into where the Terraform files and place your key into the file pubkey.pub
cd tf_files_ec2ssh
vi pubkey.pub

## Run terraform plan to see what terraform is going to do
terraform plan

## If no errors were reported with the plan, run terraform apply to put the plan into action
terraform apply

## If terraform apply was successful there should now be a new ec2 instance up and running on your AWS account
## To get the ip simply grep for the IP address from terraform show
terraform show |grep public_ip

## SSH into your new ec2 to confirm that it is up and running and accepting SSH connections from you
ssh ec2-user@ip-address -i yourprivatekey.pem

## When you are done run terraform destroy to tear down the plan
terraform destroy

