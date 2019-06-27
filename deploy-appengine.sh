#!/bin/bash

set -ex
bazel build static-files
(cd appengine && gcloud app deploy)
