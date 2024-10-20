Derived from https://github.com/AAAI-DISIM-UnivAQ/DALI (fork with the ad hoc modifications at [DaIRCModifications](https://github.com/VittoDan/DALI/tree/origin/DaIRCModifications)
# DALI
> DALI Multi Agent Systems Framework

DALI is a meta interpreter built on top of Sicstus Prolog (R) (_at the moment_).

![](DALI_logo.png)


## Installation

DALI is built upon the SICStus Prolog implementation, 
following instructions at https://sicstus.sics.se/download4.html, 
for which you a need a valid license. 
You may use any latest SICStus version at your own risk, but DALI has been tested 
to work reasonably well with the archived 4.6.0 version available at these URLS:

* macOS: https://sicstus.sics.se/sicstus/products4/sicstus/4.6.0/binaries/darwin/sp-4.6.0-x86_64-darwin-17.0.0.tar.gz
* GNU/Linux:  https://sicstus.sics.se/sicstus/products4/sicstus/4.6.0/binaries/linux/sp-4.6.0-x86_64-linux-glibc2.17.tar.gz
* Windows: https://sicstus.sics.se/sicstus/products4/sicstus/4.6.0/binaries/win32/InstallSICStus-4.6.0-x64-VC16.exe

Also some OS-specific isntructions:

**OS X & Linux:**

You can download DALI and test it by running an example DALI MAS:
```sh
git clone https://github.com/AAAI-DISIM-UnivAQ/DALI.git
cd DALI/Examples/advanced
bash startmas.sh
```
&nbsp;&nbsp;&nbsp;&nbsp; You will see different windows opening:
* &nbsp;&nbsp;&nbsp;&nbsp; Prolog LINDA server (active_server_wi.pl)
* &nbsp;&nbsp;&nbsp;&nbsp; Prolog FIPA client (active_user_wi.pl) 
* &nbsp;&nbsp;&nbsp;&nbsp; 1 instance of DALI metaintepreter for each agent (active_dali_wi.pl)

**Windows:**

You can download DALI from https://github.com/AAAI-DISIM-UnivAQ/DALI.git.
*  Unzip the repository, go to the folder "DALI/Examples/basic", and test if DALI works by duble clicking "startmas.bat" file (this will launch an example DALI MAS). \
\
&nbsp;&nbsp;&nbsp;&nbsp; You will see different windows opening:
* &nbsp;&nbsp;&nbsp;&nbsp; Prolog LINDA server (active_server_wi.pl)
* &nbsp;&nbsp;&nbsp;&nbsp; Prolog FIPA client (active_user_wi.pl) 
* &nbsp;&nbsp;&nbsp;&nbsp; 1 instance of DALI metaintepreter for each agent (active_dali_wi.pl)


## Usage example

You can find some examples into the Example folder, where examples are divided into 3 subfolders:
* __basic__: aimed at basic Windows-based setup, no agent types, every agent living in a separated sicstus window.
* __advanced__: more complex, aimed at Unix-like based environment, with agent type, instances, each agent living in a separated xterm console.
* __more__: MAS examples derived from our students projects.


## Development setup
To create a new DALI MAS, you can use an example as a boilerplate:
1.  Create a folder to contain your project, for example let's call it "projectFolder"
2.  Copy the folder "DALI/src" into "projectFolder"
3.  In "projectFolder", create a folder that will contain your DALI app, for example let's call it "DALIappFolder"
4.  Copy the content of "DALI/Examples/advanced" folder in "projectFolder/DALIappFolder"
5.  Rewrite the files contained in "projectFolder/DALIappFolder/mas/instances" and in "projectFolder/DALIappFolder/mas/instances"
    in a proper way (see DALI documentation), in order to create your DALI MAS.
6.  Open the "startmas" file and change the following variables according to your paths:
* **sicstus_home:** The SICStus prolog path
* **main_home:**  # The "projectFolder" path, in relation to the "startmas" file position (in this example it is "..")
* **dali_home:**  # The "projectFolder/src" folder path, in relation to the "startmas" file position (in this example it is "../src")
* **conf_dir:**  # The "projectFolder/conf" folder path, in relation to the "startmas" file position (in this example it is "conf")


## Release History

Check [release history](http://github.com/AAAI-DISIM-UnivAQ/DALI/releases) page.


## Contacts

Giovanni De Gasperis – [@giodegas](http://x.com/giodegas) – giovanni.degasperis-at-univaq-it

Distributed under the Apache License 2.0. See ``LICENSE`` for more information.

[http://github.com/AAAI-DISIM-UnivAQ](http://github.com/AAAI-DISIM-UnivAQ)


## Contributing
To complete
1. Fork it (<https://github.com/AAAI-DISIM-UnivAQ/DALI/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## Examples of Applications:

* in Robotics: coordination among store delivery robots: [Video](https://youtu.be/1dfWthhUovk) from S. Valentini:
   [![Delivery robots cordination](https://img.youtube.com/vi/1dfWthhUovk/0.jpg)](https://www.youtube.com/watch?v=1dfWthhUovk)

## References
* DALI 1.0 original URL: http://www.di.univaq.it/stefcost/Sito-Web-DALI/WEB-DALI (no more active)
* COSTANTINI, Stefania. [*The DALI Agent-Oriented Logic Programming Language: Summary and References 2015.*](http://people.disim.univaq.it/stefcost/pubbls/Dali_References.pdf)
* COSTANTINI S, TOCCHIO A. [*A logic programming language for multi-agent systems.*](docs/DALI_Language_description.pdf) Logics in Artificial Intelligence, Springer Berlin Heidelberg, 2002, pp:1-13.
* COSTANTINI S, TOCCHIO A. *The DALI logic programming agent-oriented language.* In Logics in Artificial Intelligence Springer Berlin Heidelberg, 2004, pp:685-688.
* COSTANTINI S, TOCCHIO A. *DALI: An Architecture for Intelligent Logical Agents.* In: AAAI Spring Symposium: Emotion, Personality, and Social Behavior. 2008. pp:13-18.
* BEVAR V, COSTANTINI S, TOCCHIO A, DE GASPERIS G. *A multi-agent system for industrial fault detection and repair.* In: Advances on Practical Applications of Agents and Multi-Agent Systems. Springer Berlin Heidelberg, 2012. pp:47-55.
* DE GASPERIS, G, BEVAR V, COSTANTINI S, TOCCHIO A, PAOLUCCI A. *Demonstrator of a multi-agent system for industrial fault detection and repair.* In: Advances on Practical Applications of Agents and Multi-Agent Systems. Springer Berlin Heidelberg, 2012. pp:237-240.
* DE GASPERIS Giovanni. *DETF 1st Release (Version 14.08a).* Zenodo. [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1044488.svg)](https://doi.org/10.5281/zenodo.1044488), 2014, August 6. 
* COSTANTINI, Stefania; DE GASPERIS, Giovanni; NAZZICONE, Giulio. *DALI for cognitive robotics: principles and prototype implementation.* In: International Symposium on Practical Aspects of Declarative Languages. Springer, Cham, 2017. p. 152-162.
* COSTANTINI, Stefania, DE GASPERIS, Giovanni, PITONI Valentina, SALUTARI Agnese. [*DALI: A multi agent system framework for the web, cognitive robotic and complex event processing.*](http://ceur-ws.org/Vol-1949/CILCpaper05.pdf), [CILC 2017](http://cilc2017.unina.it), 32nd Italian Conference on Computational Logic
26-28 September 2017, Naples, Italy
* RAFANELLI, Andrea; COSTANTINI, Stefania; DE GASPERIS, Giovanni. [*A Multi-Agent-System framework for flooding events. 2022*](https://ceur-ws.org/Vol-3261/paper11.pdf). WOA 2022: 23rd Workshop From Objects to Agents, September 1–2, Genova, Italy
* COSTANTINI, Stefania. [*Ensuring trustworthy and ethical behaviour in intelligent logical agents](https://academic.oup.com/logcom/article/32/2/443/6513773). Journal of Logic and Computation, 2022, 32.2: 443-478.
--------------
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

- Ctrl+b followed by w: opens the dashboard of the terminal instances, useful to navigate between agents' windows; you can navigate such window by pressing up and down and pressing enter will get to the highlighted terminal 

- Ctrl+b followed by an arrow key: will focus a new terminal panel in the current terminal window

- Ctrl+b followed by c: opens a new terminal window with a bash prompt, very useful for checking... welp... everything :D from processes to files' creation to manipulating stuff around the container; for instance by typing `tmux kill-session` the whole container will shut off but every command goes, from `top` if you want to check running processes to even `apt` commands 


For more technical details there is a pdf in the root of this project (in italian) explaining some of the mechanisms in here from a high level standpoint.


Also

# Possible issues

1. Bots' text messages may get jammed in race conditions due to how the messages are handled in the project
2. At times bots might not connect to the server (so don't spam the check server butto too much, remember that each button of the dashboard corresponds to a call on the socket and to the LINDA broker).

There might be other bugs that i might have encountered and forgotten about unfortunately but i hope that this project might be a fun way to explore DALI and push it to its limits (with copious amounts of extra Prolog for y'all to enjoy :D).

Have fun :D

P.S

In the project itself there might be some files that don't quite fit the project itself, those were some fun (although extremely frustrating) experiments that i carried out in the attempt to not rely on the LINDA message broker for communication with the web part (which is now handled with the sockets library of SICStus prolog which i invite the reader of this readme to check out).


To comply with the apache license the project is a fork of DALI itself with the modifications visible on the branch of this repository  [DaIRCModifications](https://github.com/VittoDan/DALI/tree/origin/DaIRCModifications)

