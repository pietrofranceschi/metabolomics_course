 #!/bin/bash

 docker run --rm -d -p 8787:8787 -e DISABLE_AUTH=true --name rstudio \
    -v$HOME:/home/rstudio/host \
    rstudio
 sensible-browser 127.0.0.1:8787