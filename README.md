# Metabolomics Course

Home (`/home/rstudio`) directory structure:

 * `host`: host's home directory (persistent)
 * `data`: data directory
 * `notebook`: directory containing R notebooks

Note:
> Files stored outside the `host` directory will be lost when you stop the
container.


## Option 1: Run the container from Docker Hub

On Linux machine:

```sh
docker run --rm -d -p 8788:8787 -e DISABLE_AUTH=true --name metabolomics_course \
    -v$HOME:/home/rstudio/host \
    pietrofranceschi/metabolomics_course
```

on MS Windows:

```sh
docker run --rm -d -p 8788:8787 -e DISABLE_AUTH=true --name metabolomics_course -v%HOMEDRIVE%%HOMEPATH%:/home/rstudio/host pietrofranceschi/metabolomics_course
```

## Option 2: Build and run the container (Linux host)

```sh
git clone https://github.com/pietrofranceschi/metabolomics_course.git
cd metabolomics_course
docker build . --tag metabolomics_course
docker run --rm -d -p 8788:8787 -e DISABLE_AUTH=true --name metabolomics_course \
    -v$HOME:/home/rstudio/host \
    metabolomics_course
```

## Open RStudio

Open a browser and go to 127.0.0.1:8788.

## Stop (and destroy) the container

```sh
docker stop metabolomics_course
```
