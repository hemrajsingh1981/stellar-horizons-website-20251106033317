#!/bin/bash

# Deployment script for Stellar Horizons

# Configuration - Replace with your actual bucket name
BUCKET_NAME="your-gcs-bucket-name"

echo "Deploying to GCS bucket: $BUCKET_NAME..."

# Sync the dist directory to the GCS bucket
# The -m flag enables parallel multi-threaded uploads.
# The -d flag ensures that files in the destination that do not exist in the source are deleted.
# The -r flag enables recursive synchronization.
# 'dist/' is the source directory, containing the static site files.
# 'gs://$BUCKET_NAME' is the destination GCS bucket.
gsutil -m rsync -d -r dist/ gs://$BUCKET_NAME

# Check the exit status of the gsutil command.
if [ $? -eq 0 ]; then
    echo "Deployment successful!"
else
    echo "Deployment failed."
    exit 1
fi
