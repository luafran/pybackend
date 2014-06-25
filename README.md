# pyuss

Playground project that integrates [pyzeromq](https://github.com/zeromq/pyzmq)
with [tornado](http://www.tornadoweb.org/en/stable/)

This is a draft that mix zeromq [Clone Pattern](http://zguide.zeromq.org/page:all#Reliable-Pub-Sub-Clone-Pattern)
with a basic tornado web handler that uses mongodb using [motor](http://motor.readthedocs.org/en/stable/)

Clone this repo.

Install OS dependencies.
(May be some dependency is missing since setup.sh was not tested in a clean environment yet)

```shell
$ sudo ./setup.sh
`````

Open a new terminal (in order for virtualenvwrapper functions to be available).
Create a new virtualenv and install pip dependencies.

```shell
$ mkvirtualenv pyuss
$ pip install -Ur requirements.txt
```````````
Make sure mongodb is running on localhost and default port.

Open a terminal, load virtual env and run server.

```shell
$ workon pyuss 
$ python server.py
```````````

Open a terminal, load virtual env and run zmq clone client.

```shell
$ workon pyuss 
$ python clonecli5.py
```````````

Using a REST client do POSTs like
http://localhost:8888/msgs?msg=test1

to insert messages in the database. Each message will be inserted in a mongo collection named messages in pyuss database.

To get all inserted messages do a GET to

http://localhost:8888/msgs
