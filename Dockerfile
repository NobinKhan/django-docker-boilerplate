# FROM python:3.10.4-alpine AS poetry

# WORKDIR /opt/project_files

# COPY pyproject.toml poetry.lock .
# RUN curl -sSL https://install.python-poetry.org | python3 -
# RUN export PATH=$HOME/.poetry/bin:$PATH
# RUN poetry export -f requirements.txt --output requirements.txt

# Final image
FROM python:slim

WORKDIR /opt/project_files

# RUN apk add --no-cache unit-python3 curl postgresql-client pango zlib jpeg openjpeg font-noto msttcorefonts-installer

# COPY --from=poetry /opt/project_files/requirements.txt .
COPY . .
RUN apt-get update && apt-get -y install g++ libpq-dev gcc unixodbc unixodbc-dev
RUN pip install --upgrade pip && pip install -r requirements.txt
CMD ["./manage.py", "runserver", "0.0.0.0:8000"]