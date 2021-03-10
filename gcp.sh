#!/bin/bash

gcloud_sdk_base=${HOME}/bin/google-cloud-sdk

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${gcloud_sdk_base}/path.bash.inc' ]; then . '${gcloud_sdk_base}/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${gcloud_sdk_base}/completion.bash.inc' ]; then . '${gcloud_sdk_base}/completion.bash.inc'; fi
