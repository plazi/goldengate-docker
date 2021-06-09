# Plazi GoldenGATE Server Docker Image

This project creates a Docker image of the [GoldenGATE Document Markup & Retrieval Server by Guido Sautter](https://github.com/gsautter/goldengate-server) with plazi specific extensions.

The primary purpose of this project is to allow to easily set up test servers to test new datasets.

## Usage

The image is published on Dockerhub, so you can run GoldenGATE without having to check out this project, simply run:

    docker run -d --name treatmentbank -p 8080:8080 -p 8015:8015 plazi/goldengate

Note that the container name ("treatmentbank" in the example) can be set arbitrarily, it is used when conncting to the console.

Once started you can access http://localhost:8080/GgServer/ and http://localhost:8080/GgServer/search

## Building 

To build the image yourself:

    docker build . -t plazi/goldengate

## FAQ

### Is this the whole Plazi TreatmentBank?

This is the core of the software running it but without data and some extensions.

### What's the username and password?

the default admin user is "plazi" with password "plazi".

### How can I change the password and add users?

TBD

### How can I access the GoldenGATE console?

The GoldenGATE console can only be accessed from within the docker container, so we have to use  `docker exec` 
to start the console cient `ggsc` from within the container

    docker exec -ti treatmentbank sh /usr/local/GgServer/bin/ggsc -a="<consoleAccessPassword>" -t=20

### How can I access the console of a running server?

You can only access the console of a running server, starting in console mode is no longer supported.

### Where do I find more documentation about GoldenGATE?

TBDs

### Shouldn't this be two images, one for the backend and one for the eb-application?

In principle yes. The current architecture would be better reflected by tow containers started in a docker-compose. However
the web-access might be soon become part of the core GoldenGATE server, so the image reflects this hopefully coming 
simplification.