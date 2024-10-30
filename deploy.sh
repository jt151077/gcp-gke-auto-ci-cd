#!/bin/bash

echo 'Building and deploying the latest Docker image'

project=$(grep -o '\"project_id\": \"[^\"]*' terraform.tfvars.json | grep -o '[^\"]*$')
region=$(grep -o '\"project_default_region\": \"[^\"]*' terraform.tfvars.json | grep -o '[^\"]*$')


gcloud container clusters get-credentials dev-cluster --location=$region --project=$project
kubectl create namespace jeremy-ns-dev
gcloud container clusters get-credentials prod-cluster --location=$region --project=$project
kubectl create namespace jeremy-ns-prod
gcloud builds submit --config=cloudbuild.yaml --project=$project --substitutions=_REGION=$region --region=$region 
