# Metabolomics Course

Home (`/home/rstudio`) directory structure:

 * `host`: host's home directory (persistent)
 * `data`: data directory
 * `notebook`: directory containing R notebooks

Note:
> Files stored outside the `host` directory will be lost when you stop the
container.

## Build and run the container

```sh
git clone https://github.com/pietrofranceschi/metabolomics_course.git
cd metabolomics_course
docker build . --tag metabolomics_course
./run
```

## Stop (and destroy) the container

```sh
docker stop metabolomics_course
```