#!/bin/bash
#
#

export Namespace=prometheus

envsubst < secret.yaml.tpl | kubectl apply -f - 

