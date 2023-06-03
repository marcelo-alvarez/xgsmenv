# conda packages
echo Current time $(date) Installing conda packages
echo condadir is $CONDADIR

conda config --set solver classic
conda install --yes -n base conda-libmamba-solver
conda config --set solver libmamba

conda install --yes -c conda-forge -c nvidia \
    astropy \
    cuda-nvcc \
    cudatoolkit \
    fitsio \
    healpy \
    ipython \
    jax \
    jaxlib=*=*cuda* \
    joblib \
    jupyter \
    matplotlib \
    numpy \
    scipy \
 && rm -rf $CONDADIR/pkgs/*

if [ $? != 0 ]; then
    echo "ERROR installing conda packages; exiting"
    exit 1
fi

conda list --export | grep -v conda > "$CONDADIR/pkg_list.txt"
conda config --set solver classic

echo Current time $(date) Done installing conda packages
