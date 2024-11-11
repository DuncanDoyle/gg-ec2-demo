# Gloo Gateway EC2

## Creating the AWS Secret

Set the MY_AWS_ACCESS_KEY and MY_AWS_SECRET_ACCESS_KEY environment variables. The required values can be found in the `~/.aws/credentials` file.

```
glooctl create secret aws \
--name gloo-tag-group1 \
--namespace default \
--access-key $MY_AWS_ACCESS_KEY \
--secret-key $MY_AWS_SECRET_ACCESS_KEY
```

## Echo App on EC2 instance

Login to the EC2 instance (use the Public IPv4 DNS name that is assigned after spinning up the instance):

```
ssh -i ~/.ssh/{aws-pem-file} ec2-user@{aws-instance-ipv4-address}
```

wget https://mitch-solo-public.s3.amazonaws.com/echoapp2
chmod +x echoapp2
sudo ./echoapp2 --port 81 &


# AWS Instance Direct
curl http://<ec2-instance-public-ip>:81/

curl http://ec2-3-77-201-164.eu-central-1.compute.amazonaws.com:81

curl -v http://ec2-3-77-201-164.eu-central-1.compute.amazonaws.com:81/?code=203


## K8S Gateway API
curl -v http://api.example.com/echoapp/?code=203

## Gloo Edge API
curl -v http://api.example.com/echoapp/?code=203
