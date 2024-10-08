# homebrew-sched
This is a Homebrew formula for [SCHED](https://www.aoc.nrao.edu/software/sched/index.html), a program for planning and scheduling Very Long Baseline Array (VLBA), High Sensitivity Array (HSA), Global Very Long Baseline Interferometry (Global VLBI), European VLBI Network (EVN), Long Baseline Array (LBA; Australia), Korean VLBI Network (KVN), VLBI on the Karl G. Jansky Very Large Array (VLA) and other VLBI observations. It writes VEX files that describe the details of an observation and are becoming the near universal format for distribution of schedules to VLBI telescopes and correlators.

## Installation of SCHED with brew using this formula
homebrew recently removed pgplot for a Licence issue. 
I made [a back up (+ minor modificaiton) of the latest pgplot formula just before being removed](https://github.com/kazuakiyama/homebrew-pgplot).
You just need to tap this repository and install sched.

```bash
# install PGPLOT
brew tap kazuakiyama/pgplot
brew install pgplot

# install NRAO SCHED
brew tap kazuakiyama/sched
brew install sched
```

As zsh has `sched` as a default command, users may not run SCHED just by typing `sched` in their shells.
For an ad-hoc mitigation, this homebrew formula will add an alias `nsched` (for "N"RAO SCHED) to the `sched` command so that users don't have to type the full path in zsh. 
The additional files (doc, notes, examples, setting files, etc) will be installed into the directory given by `brew --prefix sched`. 

You should define `$SCHED` once the package is installed. Also, don't forget to add paths for PGPLOT.
For instance, you can add the following line to your ~/.bashrc_profile or ~/.zprofile files (and remember to source the file to update your current session):

```bash
PGPLOT_DIR=`brew --prefix pgplot`/lib
if [ -e $PGPLOT_DIR ]; then
  export PGPLOT_DIR=$PGPLOT_DIR
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PGPLOT_DIR
  export PGPLOT_DEV=/xwin # This is up to your preference. /xserve might be your choise.
fi

SCHED_DIR=`brew --prefix sched`
if [ -e $SCHED_DIR ]; then
  export SCHED=$SCHED_DIR
fi
```

## Contact
If you find any issues related to this brew formula, please post [issues](https://github.com/kazuakiyama/homebrew-sched/issues) in this github repository
or directly contact me ([Kazu Akiyama](https://sites.mit.edu/kazuakiyama)). I do not frequently check the latest version of the package. Please contact me if you find a newer version of SCHED which is not yet reflected in my formula.
For any issues on SCHED itself, you should contact the SCHED developer team at the National Radio Astronomy Observatory.
