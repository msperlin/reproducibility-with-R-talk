FROM rocker/tidyverse:4.1.0

#RUN useradd --create-home msperlin

#USER msperlin

RUN R -e "install.packages('GetDFPData2')"

WORKDIR /home/msperlin

RUN mkdir output

ADD R-code ./R-code

#RUN mkdir /home/output
RUN R -e "getwd()"

RUN R -e "fs::dir_tree()"

WORKDIR /home/msperlin/R-code

CMD Rscript script-research.R
