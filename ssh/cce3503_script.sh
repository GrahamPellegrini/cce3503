#!/bin/bash
# ALWAYS specify CPU and RAM resources needed as well as walltime
##SBATCH --partition=teaching_gpu
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=200M
#SBATCH --time=0-10:00:00
###SBATCH --reservation=cce3015


# job parameters
#SBATCH --output=/opt/users/gpel0001/cce3503/ssh/out/cc3503_slurm_%A_%a.out
#SBATCH --error=/opt/users/gpel0001/cce3503/ssh/err/cc3503_slurm_%A_%a.err
#SBATCH --account=undergrad

# email user with progress
#SBATCH --mail-user=graham.pellegrini.22@um.edu.mt
#SBATCH --mail-type=all

# Define virtual environment activation path
VENV_PATH="/opt/users/gpel0001/cce3503/cce3503-venv/bin/activate"

# Activate virtual environment if it exists
if [ -f "$VENV_PATH" ]; then
    echo "Virtual environment found, activating"
    source "$VENV_PATH"
else
    echo "Virtual environment not found!"
    exit 1
fi

# Define the path to the notebook you want to re-run
NOTEBOOK_PATH="/opt/users/gpel0001/cce3503/assignment-2/multi-label-classification.ipynb"

# Re-run the notebook and save the output back to the same file
jupyter nbconvert --execute --to notebook \
    --allow-errors --inplace \
    "$NOTEBOOK_PATH"

# Indicate that the job has finished
echo "Job finished successfully"