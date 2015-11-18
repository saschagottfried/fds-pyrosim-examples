# fds-pyrosim-examples
Collection of PyroSim models created by Thunderhead Engineering

* [Atrium with fans](http://www.thunderheadeng.com/pyrosim/fundamentals/#atrium_example)


## FDS environment to run multiple meshes using MPI
FDS 6.3.X requires Open MPI 1.8.4 to run in parallel mode. NIST provides [information about requirements](https://github.com/firemodels/fds-smv/wiki/Installing-and-Running-FDS-on-a-Linux-Cluster#running-with-mpi-distributed-memory-computing) as well as [pre-compiled binaries](https://github.com/firemodels/fds-smv/wiki/Installing-Open-MPI-on-a-Linux-Cluster#installing-open-mpi-from-pre-compiled-binaries).

Validate Open MPI environment 

```
$ /shared/openmpi_64/bin/mpiexec -version
nmpiexec (OpenRTE) 1.8.4

Report bugs to http://www.open-mpi.org/community/help/
```

Add FDS libraries to shared libraries environment

```
$ export LD_LIBRARY_PATH=~/Downloads/fds-smv/6.3.0/bin/LIB64
```

Increase stack size. Otherwise a larger model runs into segmentation fault.

```
$ ulimit -s unlimited
```

Limit OpenMP threads for MPI execution

```
$ export OMP_NUM_THREADS=1
```

Run the model

```
$ /shared/openmpi_64/bin/mpiexec -np 4 ~/Downloads/fds-smv/6.3.0/bin/fds atrium_with_fans.fds 
 Mesh   1 is assigned to MPI Process   0
 Mesh   2 is assigned to MPI Process   1
 Mesh   3 is assigned to MPI Process   2
 Mesh   4 is assigned to MPI Process   3
 OpenMP thread   0 of   0 assigned to MPI process   0 of   3
 OpenMP thread   0 of   0 assigned to MPI process   1 of   3
 OpenMP thread   0 of   0 assigned to MPI process   3 of   3
 OpenMP thread   0 of   0 assigned to MPI process   2 of   3

 Fire Dynamics Simulator

 Current Date     : November 18, 2015  22:09:05
 Version          : FDS 6.3.0
 Revision         : Git-r1-12-gf7f4148
 Revision Date    : Wed Sep 30 23:20:47 2015 -0400
 Compilation Date : Oct 01, 2015  08:23:41

 MPI Enabled; Number of MPI Processes:     4
 OpenMP Enabled; Number of OpenMP Threads:   1

 Job TITLE        : 
 Job ID string    : atrium_with_fans

 Time Step:      1,    Simulation Time:      0.06 s
 Time Step:      2,    Simulation Time:      0.11 s
 Time Step:      3,    Simulation Time:      0.17 s
 Time Step:      4,    Simulation Time:      0.22 s
 Time Step:      5,    Simulation Time:      0.28 s
 Time Step:      6,    Simulation Time:      0.34 s
 Time Step:      7,    Simulation Time:      0.39 s
```

## Run model with FDS 6.3.1
FDS 6.3.1 is a bit less verbose but shows useful information on MPI version and implementation.

```
$ /shared/openmpi_64/bin/mpiexec -np 4 ~/Downloads/fds-smv/6.3.1/bin/fds atrium_with_fans.fds 
 Mesh      1 is assigned to MPI Process      0
 Mesh      2 is assigned to MPI Process      1
 Mesh      3 is assigned to MPI Process      2
 Mesh      4 is assigned to MPI Process      3
 Completed Initialization Step  1
 Completed Initialization Step  2
 Completed Initialization Step  3
 Completed Initialization Step  4

 Fire Dynamics Simulator

 Current Date     : November 18, 2015  22:25:35
 Version          : FDS 6.3.1
 Revision         : Git-r4-19-g352eda9
 Revision Date    : Mon Nov 9 17:25:52 2015 -0500
 Compilation Date : Nov 09, 2015  21:38:33

 MPI Enabled; Number of MPI Processes:     4
 OpenMP Enabled; Number of OpenMP Threads:   1

 MPI version: 3.0
 MPI library version: Open MPI v1.8.4, package: Open MPI gforney@blaze Distribution, ident: 1.8.4, repo rev: v1.8.3-330-g0344f04, Dec 19, 2014

 Job TITLE        : 
 Job ID string    : atrium_with_fans

 Time Step:      1, Simulation Time:      0.06 s
 Time Step:      2, Simulation Time:      0.11 s
 Time Step:      3, Simulation Time:      0.17 s
 Time Step:      4, Simulation Time:      0.22 s
 Time Step:      5, Simulation Time:      0.28 s
 ```
