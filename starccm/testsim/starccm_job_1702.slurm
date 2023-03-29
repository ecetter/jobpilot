#!/bin/bash 

#SBATCH --job-name=starjob
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=24 
#SBATCH --mem=16GB
#SBATCH --time=01:00:00 
#SBATCH --partition=open 

module load starccm

NODEFILE="$(pwd)/slurmhosts.$SLURM_JOB_ID.txt"
srun /bin/hostname -s &> $NODEFILE

starccm+ -batch -nn ${SLURM_NNODES} -np ${SLURM_NTASKS} -machinefile ${NODEFILE} -mpibootstrap ssh Test.sim >&output.txt

