FROM python:slim
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENV NAME world
CMD ["python", "app.py"]
