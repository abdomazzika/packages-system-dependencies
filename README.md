# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* About application

* System dependencies

* Cloning application

* Setup and Configuration

* How to test the app functionality


# Package system dependencies Application

database-driven RESTful API web service that looks up received packages
and returns a list of system libraries and the package manager needed to
install them.

# System dependencies

* Docker engine, you can install form here [install docker for linux]

* Docker-compose, you can install from here [install docker compose]


# Getting Start 

# Clone App

```bash
cd ~
git clone https://github.com/abdomazzika/packages-system-dependencies.git
```

# Setup

* Navigate to the app directory

```bash
cd ~/packages-system-dependencies
```

* Run docker-compose up to start the app and all env containers
Note: before you running docker-compose up command make sure that there is no process take this ports [3000, 3306]

```bash
docker-compose up
```


* To verify that the containers up and running you may run

```bash
docker ps
```

* OR you can just setup the application manually  by using

```bash
bin/bundle install
bin/rake db:create db:schema:load db:migrate
bin/rails s -b 0.0.0.0
```

Now our environment upp and running, we can see the follolwing:

- packages system dependencies rails application listen on http://host_ip:3000

# Test app

Now we gonna to run some commands to insert data and show what happens

* send this json to add a new packages , Replace host_ip by your ip address
Note: the package data will send in the request body.


```bash
curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/packages" -d'
{
    "package": {
	    "name": "a-package",
	    "version": "1.0.1"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/packages" -d'
{
    "package": {
	    "name": "b-package",
	    "version": "1.0.1"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/packages" -d'
{
    "package": {
	    "name": "c-package",
	    "version": "1.0.1"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/packages" -d'
{
    "package": {
	    "name": "d-package",
	    "version": "1.0.1"
    }
}'

```
* send this json to add a new operating systems , Replace host_ip by your ip address
Note: the operating system data will send in the request body.


```bash
curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/operating_systems" -d'
{
    "operating_system": {
	    "name": "linux",
	    "vendor": "redhat",
	    "bits": "64",
	    "package_manager": "yum"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/operating_systems" -d'
{
    "operating_system": {
	    "name": "linux",
	    "vendor": "debian",
	    "bits": "32",
	    "package_manager": "apt-get"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/operating_systems" -d'
{
    "operating_system": {
	    "name": "macos",
	    "vendor": "apple",
	    "bits": "64",
	    "package_manager": "brew"
    }
}'

```

* send this json to add a new system_dependencies , Replace host_ip by your ip address
Note: the system_dependency data will send in the request body.


```bash
curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/system_dependencies" -d'
{
    "system_dependency": {
	    "name": "x-lib",
	    "version": "1.3.2"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/system_dependencies" -d'
{
    "system_dependency": {
	    "name": "y-lib",
	    "version": "1.3.2"
    }
}'

curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/system_dependencies" -d'
{
    "system_dependency": {
	    "name": "z-lib",
	    "version": "1.3.2"
    }
}'
```


* send this json to relate packages with system dependencies for specific operating system,
 Replace host_ip by your ip address


```bash
curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/package_system_dependencies" -d'
{
    "package_system_dependency": {
	    "package": { 
	        "name": "a-package",
            "version": "1.0.1"
        },
        "operating_system": {
            "name": "linux",
            "vendor": "redhat",
            "bits": "64",
            "package_manager": "yum"
        },
        "system_dependency": {
            "name": "x-lib",
            "version": "1.3.2"
        }
    }
}'

```

* send this json to search about system dependencies for a list of gems,
 Replace host_ip by your ip address


```bash
curl -XPOST -H "Content-Type: application/json" "http://<host_ip>:3000/api/lookups/package_system_dependencies" -d'
{
   "lookup": {
	   	"packages": [{ "name": "a-package", "version": "1.0.1" },
	        { "name": "b-package", "version": "1.0.1" },
	        { "name": "c-package", "version": "1.0.1" },
	        { "name": "d-package", "version": "1.0.1" }
	    ],
	    "operating_system": {
	        "name": "linux",
	        "vendor": "redhat",
	        "bits": "64"
	    }
   } 
}'

```

* Then we will connect to our test app by:

```bash
docker exec -it <TEST-CONTAINER-ID> bash
```

go to the app directory:

```bash
cd app
```
add in your Gemfile:

```bash
echo gem 'system_dependencies', :git => 'git://github.com/abdomazzika/system_dependencies.git' >> Gemfile
```

then run bundle install to install your gem:

```bash
bundle install
```

connect to rails console by:

```bash
rails c
```

And finally let us run the below commands and see what we have:

```ruby
@my_app = SystemDependencies::Libraries.new('localhost', '3001')
@my_app.local_gems
@my_app.operating_system_info
@my_app.system_dependencies
```
Now we finished from the app logic and how to make this app up and running.
Thanks.

[install docker for linux]: https://docs.docker.com/engine/installation/linux/
[install docker compose]: https://docs.docker.com/compose/install/
