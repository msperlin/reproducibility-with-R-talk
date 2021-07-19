FROM rocker/tidyverse:4.1.0

ADD R-code R-code

RUN R -e "install.packages('renv')" \
    && R -e "install.packages(renv::dependencies('R-code')[['Package']])"

CMD Rscript R-code/script-research.R
