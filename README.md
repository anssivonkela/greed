This is just a POC containing:

- Docker for web application enviroment containment
- Django Rest Framework for application server
- Robot Framework for testing using robotframework-request library

Running
-------

The Dockerfile to setup service resides in the directory dockerfiles.
To build the enviroment, just run in said direcotry:
docker build .

After the build, simply run the image with:
'''
docker run -i -t image_id  (or with daemonized form -d, if so prefered).
'''

The application code patches are reside in dockerfiles/pymod, which contain
the minor applcation code modification needed on top of a freshly installed django
rest framework.


Testing the webapp
-------
Assuming you are running a Linuxy enviroment with Python install,
you need to setup Robot framework (if not already installed) with the following two commmand:
'''
sudo pip install robotframework
sudo pip install -U robotframework-requests
'''

Testing can be run with robot framework in the 'testing' directory:
'''
pybot basic.robot
'''

You might need to adjust the testing URL/IP depending on how your
host assigns network interface and a NATted IP address to the above
running container.

Find out the IP address available for outside access to the container,
and adjust it in the test if necessary with:
'''
docker inspect container_id_or_name |grep IPAddress
'''

Test results can be reviewed from the command line or the standard generated
report files.

