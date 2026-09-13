FROM python:3.12-slim
WORKDIR /web_app
RUN mkdir logs
COPY web_app.py .
RUN pip install flask
EXPOSE 8000
CMD ["python", "web_app.py"]