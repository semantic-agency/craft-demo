# Craft demo site

This repo contains all of the templates, front-end resources, and a MySQL database backup for “Happy Lager”, a Craft demo site.

You can find out more about Craft at [craftcms.com](https://craftcms.com/).

## Requirements

1. Docker
2. Docker Compose

## Setup

You can check out Happy Lager online from [demo.craftcms.com](https://demo.craftcms.com/).

If you want to install the site locally, follow these instructions:

1. Download/clone the repo on your computer:

   ```bash
   git clone https://github.com/semantic-agency/craft-demo.git
   ```

2. In the project root directory, create a `/plugins` directory (if it doesn't already exist) and download/clone the Translations plugin into it.

   ```bash
   mkdir plugins && \
   cd plugins && \
   git clone https://github.com/AcclaroInc/craft-translations.git
   ```

3. Run `composer install` within the clone:

   ```bash
   cd craft-demo && \
   composer install
   ```

4. Copy the `.env.example` file at the root of the project to `.env`.

5. Run this command in the CLI from your project's root to automatically generate a security key for the site: `php craft setup/security-key`

6. In the project root, run `make up`. This will build and boot up the docker containers.
   
7. In an SQL editor (Sequel Pro, TablePlus, etc.) create a new connection with the details below and import `happylager.sql` into it.

   ```
   Host: 127.0.0.1
   Port: 3306
   User: admin
   Password: password
   ```

8. Edit your `hosts` file to resolve `craft.local` to `127.0.0.1`, if necessary.

Now point your browser at `http://craft.local:8080`. You should see the Happy Lager homepage.

## Logging in

The Craft Control Panel is located at `http://craft.local:8080/admin`. You can log in with the following credentials:

* Username: `admin`
* Password: `password`

