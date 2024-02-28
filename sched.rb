class Sched < Formula
  desc "A program for planning and scheduling Very Long Baseline Interferometry (VLBI) observations"
  homepage "https://www.aoc.nrao.edu/software/sched/index.html"
  url "ftp://ftp.aoc.nrao.edu/pub/sched/sched_11.8/sched_11.8.tar.gz"
  version "11.8"
  sha256 "d512af114da189accfb25a626737ae5efd065fd9cf7e21bfff838efc91feeea1"
  revision 0

  depends_on "gcc"
  depends_on "libx11"
  depends_on "pgplot"

  fails_with :clang do
    cause "Miscompilation resulting in segfault on queries"
  end

  def install
    ENV.fortran
    ENV.deparallelize

    pgplotdir = "#{HOMEBREW_PREFIX}/lib"
    pgplotlib = "-L#{HOMEBREW_PREFIX}/lib -lpgplot -lX11 -lpng"
    xld = "-L#{HOMEBREW_PREFIX}/lib -lX11"
    
    on_intel do
      fcommand = "gfortran -Dintel_osx -Wall -fimplicit-none -fno-backslash -fallow-argument-mismatch"
      system "cd src && make", "FC='#{fcommand}'", "LPGPLOT=#{pgplotdir}", "LDPGPLOT=#{pgplotlib}", "XLD=#{xld}"
    end

    on_arm do
      fcommand = "gfortran -Darm_osx -Wall -fimplicit-none -fno-backslash -fallow-argument-mismatch"
      system "cd src && make", "FC='#{fcommand}'", "LPGPLOT=#{pgplotdir}", "LDPGPLOT=#{pgplotlib}", "XLD=#{xld}"
    end
    
    bin.install ["bin/linux64gf/sched", "bin/schclean", "bin/crd_noneg"]
    share.install Dir["README*", "*notes.txt", "catalogs", "doc", "examples", "setups"]
  end

  def caveats
    <<~EOF
      Don't forget to add paths for PGPLOT before using SCHED.
      For instance, you can add the following lines to your ~/.bash_profile or ~/.zshrc file
      (and remember to source the file to update your current session):
      PGPLOT_DIR=`brew --prefix pgplot`/share
      if [ -e $PGPLOT_DIR ]; then
        export PGPLOT_DIR=$PGPLOT_DIR
        export PGPLOT_DEV=/xwin       # This is up to your preference. /xserve might be your choise.
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PGPLOT_DIR
      fi
    EOF
  end

  test do
    system "false"
  end
end
