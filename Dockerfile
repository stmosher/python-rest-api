FROM qnib/pytest AS test
WORKDIR /src/python-rest-api
COPY ./ .

RUN pytest

#Production Docker image
FROM python:alpine3.7
WORKDIR /src/python-rest-api
COPY ./ .
RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python", "main.py"]

EXPOSE 5000