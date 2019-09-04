FROM rocker/verse:3.6.1

# Do not use apt-get install r-cran-* to install R packages!!!

# Install Python 3
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libfftw3-dev \
    libtiff5-dev \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-tk \
    libnetcdf-dev \
    git

RUN pip3 install \
  wheel \
  numpy

RUN pip3 install \
  scipy \
  pandas \
  scikit-learn \
  statsmodels \
  minepy \
  mictools

# Install packages for RStudio notebook and reticulate
RUN install2.r --error \
    -r "https://cran.rstudio.com" \
    -r "http://www.bioconductor.org/packages/release/bioc" \
    bitops \
    caTools \
    digest \
    evaluate \
    formatR \
    highr \
    knitr \
    htmltools \
    markdown \
    rmarkdown \
    yaml \
    reticulate
   

# Install other R packages
RUN install2.r --error \
    -r "https://cran.rstudio.com" \
    -r "http://www.bioconductor.org/packages/release/bioc" \
    RColorBrewer \ 
    ncdf4 \
    xcms \
    ptw \
    FactoMineR \
    factoextra \
    plotly \
    BioMark \
    corrplot \
    ropls
    


# Clean
RUN apt-get clean \
  && rm -rf /tmp/downloaded_packages/* \
  && rm -rf /var/lib/apt/lists/*

USER rstudio

RUN mkdir /home/rstudio/data
COPY data /home/rstudio/data 

RUN mkdir /home/rstudio/notebooks
COPY notebooks /home/rstudio/notebooks

USER root
