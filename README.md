# DaIRC

## An implementation of a (VERY SIMPLIFIED) version of IRC (Internet relay chat)

## Installation

### Requirements
- Docker
- A non expired SICStus prolog 4.9.0 license 
- NodeJs
- An internet connection

### Steps for installation

The installation is pretty easy:

1. Update the file at `dockerconfig/installcachetoinject.cache` with the license data of your SICStus prolog license
2. Launch your docker daemon (e.g dockerd)
3. Launch the script `dockerscript.sh` with the flag `-b` which will build the project on it's own (omit the flag to launch the last cached docker build)

### Steps for usage

- To create a user connect to the following url 127.0.0.1:8080/?user=<username>
- To create a server connect to the following url 127.0.0.1:8080/?servername=<servername>
- To create a bot click the add bot button on the server page (i would suggest to wait a few seconds to let LINDA do it's thing).

### A tiny little guide to tmux
Tmux is a necessity in this project since every agent creation implies the creation of an entire new process and, to imitate the behaviour of the opening of a terminal emulator (e.g Xterm) at each instance of agent there, this seems the best course of action to both keep that behaviour and to not have a bloated docker container.

Here i am going to list some useful commands and macros to operate in the tmux environment.

- <Ctrl>+b followed by w: opens the dashboard of the terminal instances, useful to navigate between agents' windows; you can navigate such window by pressing up and down and pressing enter will get to the highlighted terminal 

- <Ctrl>+b followed by an arrow key: will focus a new terminal panel in the current terminal window

- <Ctrl>+b followed by c: opens a new terminal window with a bash prompt, very useful for checking... welp... everything :D from processes to files' creation to manipulating stuff around the container; for instance by typing `tmux kill-session` the whole container will shut off but every command goes, from `top` if you want to check running processes to even `apt` commands 


For more technical details there is a pdf in the root of this project (in italian) explaining some of the mechanisms in here from a high level standpoint.


Also

# Possible issues

1. Bots' text messages may get jammed in race conditions due to how the messages are handled in the project
2. At times bots might not connect to the server (so don't spam the check server butto too much, remember that each button of the dashboard corresponds to a call on the socket and to the LINDA broker).

There might be other bugs that i might have encountered and forgotten about unfortunately but i hope that this project might be a fun way to explore DALI and push it to its limits (with copious amounts of extra Prolog for y'all to enjoy :D).

Have fun :D

P.S

In the project itself there might be some files that don't quite fit the project itself, those were some fun (although extremely frustrating) experiments that i carried out in the attempt to not rely on the LINDA message broker for communication with the web part (which is now handled with the sockets library of SICStus prolog which i invite the reader of this readme to check out).




