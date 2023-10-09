#!/bin/bash

#SBATCH --job-name=starmpitest
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=10
#SBATCH --mem=8GB
#SBATCH --time=01:00:00

module load starccm

NODEFILE="$(pwd)/slurmhosts.$SLURM_JOB_ID.txt"
srun /bin/hostname -s &> $NODEFILE
NTASKS=`echo $NODEFILE | wc -l`

starccm+ -np ${NTASKS} -machinefile ${NODEFILE} -mpi openmpi -mpitest
