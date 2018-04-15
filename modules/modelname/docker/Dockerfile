FROM python:3
WORKDIR /usr/adidas
ADD /tmp/adidas_backEnd /usr/adidas
RUN pip install --requirement requirements.txt
RUN pip install pystrich
CMD [ "python", "./api.py" ]
