FROM python:3.10-slim

LABEL maintainer "LTTM-DEV"

WORKDIR /pseudo-project

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache

COPY app.py .
COPY templates templates
COPY static static

CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]