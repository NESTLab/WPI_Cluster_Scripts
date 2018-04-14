# WPI Cluster Scripts for NEST Lab #

This repository contains files for use with the WPI cluster.

For more information on the WPI Cluster, read:
  * [The NESTLab wiki page](http://nestlab.net/doku.php/wiki:software:cluster)
  * [The WPI cluster guide by the admins](http://arc.wpi.edu/cluster-documentation/build/html/index.html)

## How to Use the Files ##

1. Login on the cluster using `ssh`

   ```bash
   $ ssh myuser@turing.wpi.edu
   ```
    
2. Clone this repository

   ```bash
   $ git clone https://github.com/NESTLab/WPI_Cluster_Scripts.git
   ```

### User Configuration ###

To configure your user to work with the cluster, you need to set up a
few environment variables. Start by executing this command:

```bash
$ cp ~/WPI_Cluster_Scripts/bash_profile ~/.bash_profile
```

If you plan on using ARGoS and Buzz, execute this command:

```bash
$ cp ~/WPI_Cluster_Scripts/bashrc_argos_buzz ~/.bashrc
```

If you plan on using only ARGoS, the above command works, but if you
want less clutter in your environment variables, execute this instead:

```bash
$ cp ~/WPI_Cluster_Scripts/bashrc_argos ~/.bashrc
```

If you don't plan on using ARGoS at all, it's safe to use this
instead:

```bash
$ cp ~/WPI_Cluster_Scripts/bashrc ~/.bashrc
```

### Installing and Updating ARGoS ###

To install or update ARGoS, execute the `make_argos3_bundle.sh` script
in your home directory:

```bash
$ ./WPI_Cluster_Scripts/make_argos3_bundle.sh
```

### Installing or Updating Buzz ###

To install or Update Buzz, execute the `make_buzz_bundle.sh` script in
your home directory:

```bash
$ ./WPI_Cluster_Scripts/make_buzz_bundle.sh
```

### Using the Cluster Scripts ###

Depending on what you need to run, three script skeletons are
available. Read through the scripts and change what's necessary to run
your experiments.

  * `myargosbuzzjob.sh`: this is a script that sets up ARGoS and Buzz
    execution on a node.
  * `myargosjob.sh`: this is a script that sets up ARGoS execution on
    a node.
  * `myjob.sh`: this is a script that sets up general variables to
    execute any kind of job on a node.
