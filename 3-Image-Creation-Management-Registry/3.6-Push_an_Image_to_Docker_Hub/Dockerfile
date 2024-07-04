FROM python:3.12.4-slim-bookworm
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 80
ENV NAME world
CMD ["python", "app.py"]
