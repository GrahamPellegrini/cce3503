#!/bin/bash
#SBATCH --partition=teaching_gpu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=0-01:00:00
#SBATCH --output=/opt/users/gpel0001/cce3503/ssh/out/cce3503_slurm_%A_%a.out
#SBATCH --error=/opt/users/gpel0001/cce3503/ssh/err/cce3503_slurm_%A_%a.err
#SBATCH --job-name=cce3503_feature_analysis
#SBATCH --account=undergrad
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
NOTEBOOK_PATH="/opt/users/gpel0001/cce3503/feature_analysis_run.ipynb"

# Re-run the notebook and save the output back to the same file
jupyter nbconvert --execute --to notebook \
    --allow-errors --inplace \
    "$NOTEBOOK_PATH"
