FROM python:3.12-slim
WORKDIR /app
RUN mkdir logs
COPY app.py .
RUN pip install flask
EXPOSE 8000
CMD ["python", "app.py"]