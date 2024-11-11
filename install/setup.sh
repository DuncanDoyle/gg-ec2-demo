#!/bin/sh

####################################################################################
#
# Initiates the Gloo Gateway Demo
#
# Requires an existing Gloo Gateway 1.17+ setup with ExtAuth and RateLimiting.
# Requires the glooctl CLI to be installed.
#
####################################################################################

pushd ../


#----------------------------------------- Deploy the Gateway -----------------------------------------

# create the ingress-gw namespace
kubectl create namespace ingress-gw --dry-run=client -o yaml | kubectl apply -f -

printf "\nDeploy the Gateway ...\n"
kubectl apply -f gateways/gw.yaml


# Label the gloo-system namespace, so the gateway will accept the HTTPRoute from that namespace.
printf "\nLabel gloo-system namespace ...\n"
kubectl label namespaces gloo-system --overwrite shared-gateway-access="true"

# Apply the EC2 upstream
printf "\nDeploy Upstreams ...\n"
kubectl apply -f upstreams/ec2-upstream.yaml

# Apply the VirtualService
printf "\nDeploy VirtualService...\n"
kubectl apply -f virtualservices/api-example-com-vs.yaml

# Apply the HTTPRoute
printf "\nDeploy HTTPRoute...\n"
kubectl apply -f routes/api-example-com-httproute.yaml

popd