# Plazi GoldenGATE Server Docker Image

This project creates a Docker image of the GoldenGATE Document Markup & Retrieval Server by Guido Sautter with plazi specific extensions.

## Usage

The image is published on Dockerhub, so you can run GoldenGATE without having to check out this project, simply run:

    docker run -p 8080:8080 -p 8015:8015 plazi/goldengate

## Building 

To build the image yourself:

    docker build . -t plazi/goldengate

## FAQ

### Is this the whole Plazi TreatmentBank?

This is the core of the software running it but without data and some extensions.

### Shouldn't this be two images, one for the backend and one for the eb-application?

In principle yes. The current architecture would be better reflected by tow containers started in a docker-compose. However
the web-access might be soon become part of the core GoldenGATE server, so the image reflects this hopefully coming 
simplification.

### What's the username and password?

the default admin user is "plazi" with password "plazi".

### How can I change the password and add users?

TBD

### How can I access the GoldenGATE console?

You can start it with the `-ti` options.

    docker run -ti -p 8080:8080 -p 8015:8015 plazi/goldengate

### How can I access the console of a running server?

TBD

### Where do I find more documentation about GoldenGATE?

TBDs
