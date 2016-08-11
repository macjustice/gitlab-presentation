#!/bin/bash

git lfs install
git lfs pull

s3cmd --access_key=$access_key_id --secret_key=$secret_access_key -v --delete-removed sync pkgs/ $BUCKET_PATH/pkgs/
s3cmd --access_key=$access_key_id --secret_key=$secret_access_key -v --delete-removed sync catalogs/ $BUCKET_PATH/catalogs/
s3cmd --access_key=$access_key_id --secret_key=$secret_access_key -v --delete-removed sync client_resources/ $BUCKET_PATH/client_resources/
s3cmd --access_key=$access_key_id --secret_key=$secret_access_key -v --delete-removed sync icons/ $BUCKET_PATH/icons/
s3cmd --access_key=$access_key_id --secret_key=$secret_access_key -v --delete-removed sync manifests/ $BUCKET_PATH/manifests/
s3cmd --access_key=$access_key_id --secret_key=$secret_access_key -v --delete-removed sync pkgsinfo/ $BUCKET_PATH/pkgsinfo/
