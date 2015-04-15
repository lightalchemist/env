
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/OpenBLAS/lib

export PYLEARN2_DATA_PATH=~/Projects/DeepLearningTutorials/data
export PYLEARN2_VIEWER_COMMAND="eog --new-instance"

# CUDA
# See http://www.r-tutor.com/gpu-computing/cuda-installation/cuda6.5-ubuntu
export CUDA_HOME=/usr/local/cuda-6.5 
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64 
export PATH=${CUDA_HOME}/bin:${PATH} 

# For Pylearn2/Theano
# See http://deeplearning.net/software/theano/install.html#install
export CUDA_ROOT=${CUDA_HOME}
