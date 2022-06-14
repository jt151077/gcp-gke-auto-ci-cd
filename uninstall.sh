#!/bin/bash

echo 'Destroying all resources'

gcloud beta deploy delete --file clouddeploy.yaml --force --region europe-west1 --project long-stack-353314
terraform apply -destroy -auto-approve