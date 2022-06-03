#!/bin/bash

echo 'Building and deploying the latest Docker image'

gcloud builds submit --config=cloudbuild.yaml --project=sound-aileron-352014
