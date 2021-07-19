FROM rocker/tidyverse:4.1.0

RUN R -e "install.packages('GetDFPData2')"

ADD R-code R-code

#RUN mkdir /home/output

CMD Rscript R-code/script-research.R
