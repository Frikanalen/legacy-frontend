# Frikanalen web frontend

This is an attempt to make a snapshot of the repo in 2021 in order to build a frontend package.

It can be reached at frikanalen.no.

## Running locally:

First, install the dependencies (obviously this requires yarn)

`yarn install`

Then there are two profiles to choose from; either 

* `yarn run dev` - if you are using a local Django instance (in which case it will expect to find it at `localhost:8080`), or 
* `yarn run staging` - to run the frontend against the production backend API.
