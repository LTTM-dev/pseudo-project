FROM python:3.10-slim

LABEL maintainer = "LTTM-DEV"

WORKDIR /pseudo-project

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache
RUN pip install gunicorn

COPY app.py .
COPY templates templates
COPY static static

CMD [ "python3", "-m", "gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app" ]
