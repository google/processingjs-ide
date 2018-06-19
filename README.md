# Processing.js IDE (early prototype)

This is an early prototype of a project to create a lightweight web-based IDE
for [Processing.js](http://processingjs.org/).

The target audience are students in Japan who participate in introductory
programming workshops, having the first ever experience of text-based
programming. For this reason the main focus areas of this project will be:

*   Lint and compilation checks.

*   Online / inline help system.

*   Translation of the interface to Japanese.

Currently this project includes the local version of HTML files for quick
development and a very small application to serve the static HTML file
of the IDE from Google App Engine.

## Getting started

Install the dependencies using npm

    npm install

Open the file `ide.html` in browser.

## Building the project

Currently the project is in half-way state of transition
to Bazel-based build system. So parts of the code (including
the unprocessed `ide.html`) still rely on the modules
installed with `npm install`, and parts of the code
(especially rewritten `ide-bin.html` that is intended
to be served as part of App Engine application) are
using the files produced with the Bazel build.
So you need to run both:

    npm install
    bazel build ...

Note, that you need a fairly recent verion of Bazel (tested with 0.13).

## Deploy to Google App Engine

First you need to download and install Google Cloud SDK and install Go App
Engine component (app-engine-go). Then you need to create a project using Cloud
Console
([instruction](https://cloud.google.com/appengine/docs/standard/go/quickstart))
and enable App Engine on it, and configure the default project for gcloud.

    gcloud init

Second you need to build the static assets using combination of NPM and Bazel:

    npm install
    bazel build ...

Finally you may deploy your project:

    cd appengine && gcloud app deploy

## License

Apache-2.0; see [LICENSE](LICENSE) for details.

## Disclaimer

This project is not an official Google project. It is not supported by Google
and Google specifically disclaims all warranties as to its quality,
merchantability, or fitness for a particular purpose.
