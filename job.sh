#!/bin/bash
# This script is used to run the training and sampling processes for a machine learning model.
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --gpus=a100:1
#SBATCH --mem=64G
#SBATCH --time=0-8 
#SBATCH -p general
#SBATCH -q public
#SBATCH -o=job.out
#SBATCH -e=job.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=anaray84@asu.edu
module load mamba/latest
source activate myenv
python src/train.py
python src/sample.py --ckpt_num 10
python src/sample.py --ckpt_num 20
python src/sample.py --ckpt_num 30
python src/sample.py --ckpt_num 40