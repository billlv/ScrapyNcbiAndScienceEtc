# FROM joyzoursky/python-chromedriver:3.9-selenium
FROM joyzoursky/python-chromedriver:3.6-selenium
ENV http_proxy http://192.168.100.101:1985
ENV https_proxy http://192.168.100.101:1985

RUN mkdir -p /app
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app
RUN chmod -R 777 /app
EXPOSE 6800
# CMD ["bash", "-c", "/app/mySpider/run.sh"]
CMD logparser -dir /app/logs & scrapyd
