#!/bin/bash

set -ex
bazel build static-files
(cd appengine && dev_appserver.py app.yaml)
