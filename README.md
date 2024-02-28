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

# install DIFMAP
brew tap kazuakiyama/sched
brew install sched
```

Don't forget to add paths for PGPLOT before using DIFMAP.
For instance, you can add the following line to your ~/.bashrc_profile or ~/.zprofile files (and remember to source the file to update your current session):

```bash
PGPLOT_DIR=`brew --prefix pgplot`/lib
if [ -e $PGPLOT_DIR ]; then
  export PGPLOT_DIR=$PGPLOT_DIR
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PGPLOT_DIR
  export PGPLOT_DEV=/xwin # This is up to your preference. /xserve might be your choise.
fi
```

Help files and other material will be copied to a Cellar directory for SCHED. You can get the directory path by

```bash
brew --prefix sched
```

## Contact
If you find any issues related to this brew formula, please post [issues](https://github.com/kazuakiyama/homebrew-sched/issues) in this github repository
or directly contact me ([Kazu Akiyama](https://sites.mit.edu/kazuakiyama)). I do not frequently check the latest version of the package. Please contact me if you find a newer version of SCHED which is not yet reflected in my formula.
For any issues on SCHED itself, you should contact Craig Walker at National Radio Astornomy Observatory who has maintained SCHED.
