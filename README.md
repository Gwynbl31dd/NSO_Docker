# NSO Docker

Dockerized NSO 

INTRODUCTION
------------

This is a simple Docker project to build a NSO image

REQUIREMENTS
------------

This project requires:

 * Docker
 * NSO Binary (Not included)
 * NSO packages (Not included)
   
INSTALLATION
------------
 
 * Clone this folder

 * Add the NSO Binary
 
 * run docker build i.e: ``docker image build --build-arg NSO_VERSION=4.7.4.3 -t nsotest:latest .`` (With NSO_VERSION the version of your binary)
 
* default username/password: admin/cisco123
   
TROUBLESHOOTING
---------------

/

FAQ
---

/

KNOWN ISSUES
---------------

* This is not compatible with NSO 4.X anymore

MAINTAINERS
-----------

Current maintainer(s):
 * Anthony Paulin (Gwynbl31dd) - https://github.com/Gwynbl31dd

