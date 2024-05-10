# conda packages
echo Current time $(date) Installing conda packages
echo condadir is $CONDADIR

conda config --set solver classic
conda install --yes -n base conda-libmamba-solver
conda config --set solver libmamba

conda config --set channel_priority flexible
conda install --yes -c conda-forge -c anaconda -c nvidia -c defaults \
    astropy \
    camb \
    cuda-nvcc \
    cudatoolkit \
    fitsio \
    gputil \
    healpy \
    ipython \
    jax=0.4.9 \
    jaxlib=0.4.7=*cuda* \
    joblib \
    jupyter \
    matplotlib \
    numpy \
    scipy \
    tensorboard \
 && rm -rf $CONDADIR/pkgs/*

if [ $? != 0 ]; then
    echo "ERROR installing conda packages; exiting"
    exit 1
fi

conda list --export | grep -v conda > "$CONDADIR/pkg_list.txt"
conda config --set solver classic
source $CONDADIR/bin/activate
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDADIR/lib

echo Current time $(date) Done installing conda packages
