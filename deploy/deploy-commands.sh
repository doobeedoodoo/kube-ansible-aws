#Set region.
region="ap-southeast-2"

#Spin up a Jenkins server.
cp -f jenkins.yaml.template jenkins.yaml
sed -ie "s/__KEYNAME__/makatas/g" jenkins.yaml
sed -ie "s/__ALLOWED_IP_ADDRESS__/203.87.124.146\/32/g" jenkins.yaml
aws cloudformation deploy --region $region --template jenkins.yaml --stack-name jenkins

#Spin up the application servers.
cp -f app.yaml.template app.yaml
sed -ie "s/__KEYNAME__/makatas/g" app.yaml
sed -ie "s/__ALLOWED_IP_ADDRESS__/203.87.124.146\/32/g" app.yaml
aws cloudformation deploy --region $region --template app.yaml --stack-name app
aws cloudformation describe-stacks --region $region --stack-name app

#Deploy the application


#Delete the stack.
aws cloudformation delete-stack --region $region --stack-name app

#Kubernetes Cluster

#Set up a control node.
aws cloudformation deploy --template control-node.yaml --stack-name control-node --parameter-overrides KeyName=malago InstanceType=t2.micro SSHLocation=152.32.106.26/32
