FROM python:3-slim-bullseye
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 80
ENV NAME world
CMD ["python", "app.py"]
