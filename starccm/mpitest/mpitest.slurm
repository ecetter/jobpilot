#!/bin/bash

#SBATCH --job-name=starmpitest
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=10
#SBATCH --mem=8GB
#SBATCH --time=01:00:00

module use /storage/icds/RISE/sw8/modules
module load starccm

NODEFILE="$(pwd)/slurmhosts.$SLURM_JOB_ID.txt"
srun /bin/hostname -s &> $NODEFILE

starccm+ -nn ${SLURM_NNODES} -np ${SLURM_NTASKS} -machinefile ${NODEFILE} -mpi openmpi -mpitest
