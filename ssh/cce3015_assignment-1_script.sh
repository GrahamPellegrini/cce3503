#!/bin/bash
# ALWAYS specify CPU and RAM resources needed as well as walltime
#SBATCH --partition=teaching_gpu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=0-01:00:00
# job parameters
#SBATCH --output=/opt/users/gpel0001/cce3503/ssh/out/cce3503_slurm_%A_%a.out
#SBATCH --error=/opt/users/gpel0001/cce3503/ssh/err/cce3503_slurm_%A_%a.err
#SBATCH --job-name=cce3503_feature_analysis
#SBATCH --account=undergrad
# email user with progress
#SBATCH --mail-user=graham.pellegrini.22@um.edu.mt
#SBATCH --mail-type=all
#
VENV=/opt/users/gpel0001/cce3503/cce3503-venv
if [ -d $VENV ]; then
   echo Virtual environment found, activating
   VENV+=/bin/activate
   source "$VENV"
else
   echo Virtual environment not found!
fi

# Run the jypyter notebook

jupyter nbconvert --execute --to notebook --output "feature_analysis_run" --output-dir "/opt/users/gpel0001/cce3503" "/opt/users/gpel0001/cce3503/assignment-1/feature_analysis_plots.ipynb"