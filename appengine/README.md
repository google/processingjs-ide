# Deploying the app to Appengine.

WARNING: The process is fragile. This relies on the bazel build
to prepare a directory with static assets, and then expects that `gcloud app
deploy` will handle the symlink here as it were a directory.
Before you can deploy your app, you need to install Google Cloud SDK, make sure
the Go Appengine component is installed and configure your Google Cloud SDK:

    gcloud components install app-engine-go
    gcloud init

To deploy the app, run these command from the workspace root:

    bazel build static-files && \
    (cd appengine && gcloud app deploy)

To run a local development version for quick testing:

    bazel build static-files && \
    (cd appengine && dev_appserver.py app.yaml)
