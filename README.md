# wizni docker  Images


## Architectures other than amd64?

Work is in-progress in the Docker Engine and Registry to properly support multiple OS

If you are curious about how these images are built or have issues with them, please direct all comments to [issues on the `wizspark/docker-library` repo](https://github.com/wizspark/docker-library/issues) for now.


#### Repeatability

Rebuilding the same `Dockerfile` should result in the same version of the image being packaged, even if the second build happens several versions later, or the build should fail outright, such that an inadvertent rebuild of a `Dockerfile` tagged as `0.1.0` doesn't end up containing `0.2.3`. For example, if using `apt` to install the main program for the image, be sure to pin it to a specific version (ex: `... apt-get install -y my-package=0.1.0 ...`). For dependent packages installed by `apt` there is not usually a need to pin them to a version.

No official images can be derived from, or depend on, non-official images.

#### Consistency
#TODO
All official images should provide a consistent interface. A beginning user should be able to `docker run wizni/data-generator` without needing to learn about `--entrypoint`. 
1.	If the startup process does not need arguments, just use `CMD`:


##### Runtime Configuration

By default, Docker containers are executed with reduced privileges: whitelisted Linux capabilities, Control Groups, and a default Seccomp profile (1.10+ w/ host support).  Software running in a container may require additional privileges in order to function correctly, and there are a number of command line options to customize container execution. See [`docker run` Reference](https://docs.docker.com/engine/reference/run/) and [Seccomp for Docker](https://docs.docker.com/engine/security/seccomp/) for reference.

