# Base image.
FROM python:3.9-slim

# Install Pipenv.
RUN python -m pip install pipenv

# Set working directory within the container.
WORKDIR kwzrd-site/

# Insert Pipfiles & install dependencies from lockfile.
COPY Pipfile* ./
RUN pipenv sync

# Insert the rest of the project.
COPY . .

# Set container entrypoint ~ this defines what happens when the container starts.
ENTRYPOINT ["pipenv"]
CMD ["run", "production"]
