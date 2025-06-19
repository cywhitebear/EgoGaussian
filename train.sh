#!/bin/bash
#SBATCH --mail-type=END,FAIL
#SBATCH --output=sbatch_log/%j.out
#SBATCH --error=sbatch_log/%j.err
#SBATCH --gres=gpu:1
#SBATCH --mem=50G
#SBATCH --constraint='titan_xp'

#conda activate ego-3dgs
HOME_DIR=/home/yun/EgoGaussian
DATA_DIR=${HOME_DIR}/EgoGaussian-data
OUT_DIR=${HOME_DIR}/EgoGaussian-output
export PYTHONPATH=$PYTHONPATH:/home/yun/EgoGaussian

EK_NAMES=("P03_03" "P17_01" "P18_06" "P32_01")
HOI_NAMES=("Video1" "Video2" "Video3" "Video4" "Video5")

DATA_TYPE=HOI
DATA_NAME=Video1
RUN_NAME=full_0415
CUDA_VISIBLE_DEVICES="0" # Set empty to use CPU, 0 for GPU 0, etc.
python train.py \
    --source_path ${DATA_DIR}/${DATA_TYPE}/${DATA_NAME} \
    --out_root ${OUT_DIR} \
    --data_type ${DATA_TYPE} \
    --video ${DATA_NAME} \
    --run_name ${RUN_NAME} \
    --resolution 720 \