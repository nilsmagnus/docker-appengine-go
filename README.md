Docker image to use when building golang apps for appengine with bitbucket pipelines.

The image is uploaded to dockerhub for use by anyone (nilslarsgard/go-appengine-1.9.46:0.5).

To use the image from dockerhub, use the following bitbucket-piplenes.yml file:


```
image: nilslarsgard/go-appengine-1.9.46:0.5

pipelines:
  default:
    - step:
        script: # Modify the commands below to build your repository.
          - PACKAGE_PATH="${GOPATH}/src/bitbucket.org/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}"
          - mkdir -pv "${PACKAGE_PATH}"
          - tar -cO --exclude-vcs --exclude=bitbucket-pipelines.yml . | tar -xv -C "${PACKAGE_PATH}"
          - cd "${PACKAGE_PATH}"
          - go get -v
          - go build -v
          - go test -v
```


Enjoy.
