FROM debian:latest

RUN apt-get update
RUN apt-get install -y ca-certificates gnupg wget git \
   texlive-latex-recommended texlive-fonts-extra texlive-latex-extra \
   pandoc p7zip-full pip
RUN pip install  MarkdownPP
USER 0
RUN mkdir -p  /oscp
RUN mkdir -p  /oscp/report_tool
RUN mkdir -p  /oscp/scripts
RUN cd /oscp
RUN git clone https://github.com/beed2112/OSCP-Exam-Report-Template.git /oscp/scripts/
RUN wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex -O /usr/share/pandoc/data/templates/eisvogel.latex
RUN alias tools='cd /oscp/scripts'
RUN alias lab='/oscp/scripts/generate-reports.sh lab-report'
RUN alias exam='/oscp/scripts/generate-reports.sh exam-report'

RUN cp /oscp/scripts/.bashrc ~/.bashrc
RUN cp /oscp/scripts/motd /etc/motd  

