miceDelaunay
============

Processing sketch that listens to several computer's mouse inputs to draw a Delaunay diagram

Basically, this s ketch is a comnination of Lee Byron's [Mesh library](http://www.leebyron.com/else/mesh), which is used to build the Delaunay diagram, with Abe Pazos' [twoMice](https://github.com/hamoid/balconylab/tree/master/twoMice) program, which provides the local network communication.

Currently it is able to listen to the mouse inputs of the local computer plus another computer in a network. See config_template.pde for information on how to configure the network connection.
