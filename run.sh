export LD_LIBRARY_PATH=../bin/LIB64
export OMP_NUM_THREADS=1
ulimit -s unlimited
mkdir atrium_with_fans
cp atrium_with_fans.fds atrium_with_fans
cd atrium_with_fans
../dist/openmpi_64/bin/mpiexec -np 4 ../bin/fds atrium_with_fans.fds &> stdout.log