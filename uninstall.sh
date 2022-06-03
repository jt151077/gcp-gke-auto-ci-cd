#!/bin/bash

echo 'Destroying all resources'

gcloud beta deploy delete --file clouddeploy.yaml --force --region europe-west1 --project sound-aileron-352014
terraform apply -destroy -auto-approve