# Install pip packages.
echo Installing pip packages at $(date)

# JAX install follows: https://docs.nersc.gov/development/languages/python/using-python-perlmutter/#jax
pip install --no-cache-dir "jax[cuda12]==0.4.9" "jaxlib==0.4.7" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

module list

# see https://docs.nersc.gov/development/languages/python/parallel-python/
pip install --force --no-cache-dir --no-binary=mpi4py mpi4py
pip install cython

if [ $? != 0 ]; then
    echo "ERROR installing pip packages; exiting"
    exit 1
fi

echo Current time $(date) Done installing conda packages
