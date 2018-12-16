#!/bin/bash
#

# pip3 install jinja2-cli

cd $(dirname $0)

IngressClass=inner-nginx
NAMESPACE=ingress-system--${IngressClass}

LoadbalancerID=lb-2zehwyt3p9wx27z3pp5lf

mkdir -p ${IngressClass}
jinja2 -D Namespace="${NAMESPACE}" \
       -D LoadbalancerID=${LoadbalancerID} \
       -D IngressClass=${IngressClass} \
       ingress-controller-template.yml.j2 > ${IngressClass}/ingress-controller.yml


## demo

NAESPACE_DEMO=${NAMESPACE}-demo
jinja2 -D Namespace="${NAESPACE_DEMO}" \
       -D IngressClass=${IngressClass} \
       ingress-demo.yml.j2 > ${IngressClass}/ingress-demo.yml

# curl -H "Host: foo.bar.com" http://slb-ip/
