# Hipache Dockerfile
A minimal Hipache image.  If `$CFG` is provided, it will source a config file from the given URL.

Built with inspiration from the http://arcus.io Dockerfiles.

## Why?
So that I can stand up various test deploys of a product dynamically.  The idea is that I can put one in a directory, have a small inotify watcher deploy a build, and then update Hipache to include a route to that build.
