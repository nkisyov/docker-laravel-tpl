# docker-laravel-tpl

A simple Docker setup for runniung Laravel app.

# Setup

Remove the `.gitignore` file from `public-html` folder.
Copy your Laravel project source in `public-html` folder.
Have in mind composer is not installed in this template.

Create environment file `.env` and edit it with preffered custom image name and port

```bash
cd docker/
cp .env-example .env
```

Build Docker image

```bash
chmod +x cmd.sh # Optional, if execution rights are missing for in cmd.sh

./cmd.sh build
```

# Usage

App start
```bash
./cmd.sh run
```

App stop
```bash
./cmd.sh stop
```

For other commands
```bash
./cmd.sh -h
```
