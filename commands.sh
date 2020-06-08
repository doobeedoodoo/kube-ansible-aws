aws cloudformation deploy --template control-node.yaml --stack-name control-node --parameter-overrides KeyName=malago InstanceType=t2.micro SSHLocation=152.32.106.26/32

aws cloudformation delete-stack --stack-name control-node