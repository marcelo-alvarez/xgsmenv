=======
xgsmenv
=======

Introduction
------------

This package contains scripts for installing xgsmenv, an environment for
running extraglactic sky modeling software under development (xgsm). Currently
configured for running healpy and GPU-enabled jax on Perlmutter at NERSC.

Quick start
-----------

Install::

    # set target
    prefix=/prepend-path-here/xgsmenv # <-- where this version will be installed
    mkdir -p ${prefix}

    tmp_build_dir=/path-to-temporary-build-directory
    git clone https://github.com/marcelo-alvarez/xgsmenv ${tmp_build_dir}
    cd ${tmp_build_dir}

    unset PYTHONPATH
    export XGSMENVVERSION=$(date '+%Y%m%d')-0.0.0 # <-- name of this version
    CONF=perlmutter PKGS=default PREFIX=${prefix} ./install.sh |& tee install.log

Load the environment installed above::

    module use ${prefix}/${XGSMENVVERSION}/modulefiles
    module load xgsmenv
