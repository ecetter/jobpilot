#!/bin/bash

#SBATCH --job-name=nozzle
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=20
#SBATCH --mem-per-cpu=4G
#SBATCH --time=5:00:00

module purge
module load comsol mpich

NODEFILE="$(pwd)/slurmhosts.$SLURM_JOB_ID.txt"
srun /bin/hostname -s &> $NODEFILE

comsol batch -nn ${SLURM_NNODES} -np ${SLURM_NTASKS_PER_NODE} -mpibootstrap slurm -inputfile SpheroidNozzleSimple3D.mph -outputfile out_SpheroidNozzleSimple3D.mph -batchlog simlog.txt

