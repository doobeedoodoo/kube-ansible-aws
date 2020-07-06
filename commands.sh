#Set up a control node.
aws cloudformation deploy --template control-node.yaml --stack-name control-node --parameter-overrides KeyName=malago InstanceType=t2.micro SSHLocation=152.32.106.26/32

#Prepare CloudFormation file.
region="ap-southeast-2"
cp -f jenkins.yaml.template jenkins.yaml
sed -ie "s/__KEYNAME__/makatas/g" jenkins.yaml
sed -ie "s/__ALLOWED_IP_ADDRESS__/203.87.124.146\/32/g" jenkins.yaml

#Instantiate a Jenkins server.
aws cloudformation deploy --region $region --template jenkins.yaml --stack-name jenkins

#Delete the stack.
aws cloudformation delete-stack --stack-name jenkins
