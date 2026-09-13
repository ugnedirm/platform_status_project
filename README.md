# How to run (locally)

`docker compose up --build`

- Web application: http://localhost:8000
- Health check: http://localhost:8000/health
- Status from monitor: http://localhost:8000/status

# Deploy (background service, build included)

`chmod +x deploy.sh`

`sudo ./deploy.sh`

- Builds the images, installs web_application_status.service (WorkingDirectory auto-set to user's current path), enables and starts the background service.


