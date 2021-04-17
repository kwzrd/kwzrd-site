# Base image.
FROM python:3.9-slim

# Install Pipenv.
RUN python -m pip install pipenv

# Set working directory within the container.
WORKDIR kwzrd-site/

# Insert Pipfiles & install dependencies from lockfile.
COPY Pipfile* ./
RUN pipenv sync

# Insert the application.
COPY app app

# Expose the port on which Gunicorn listens.
EXPOSE 8001

# Set container entrypoint ~ this defines what happens when the container starts.
ENTRYPOINT ["pipenv"]
CMD ["run", "production"]
