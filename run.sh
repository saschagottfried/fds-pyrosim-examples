export LD_LIBRARY_PATH=../bin/LIB64
export OMP_NUM_THREADS=1
ulimit -s unlimited
WORK_DIR="atrium_with_fans-$(uuid)"
mkdir $WORK_DIR
cp atrium_with_fans.fds $WORK_DIR
cd $WORK_DIR
../dist/openmpi_64/bin/mpiexec -np 4 ../bin/fds atrium_with_fans.fds &> stdout.log
