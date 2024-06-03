#!/bin/bash

set -eu

EXPNR=000
SAVEPATH="_runs"
DATAPATH="_data/RAVEN-10000"
#DATAPATHIRAVEN="/dccstor/saentis/data/I-RAVEN/"
EXPNAME="nvsa_test2"
EXPPATH="${SAVEPATH}/${EXPNAME}/"
SEED=1234
RUN=0
BATCH_SIZE=1
WORKERS=0

# NVSA specific backend
#source /opt/share/anaconda3-2019.03/x86_64/bin/activate py37_torch111
source _venv/bin/activate

# Center
#python raven/main_nvsa_marg.py --mode train --config center_single --epochs 50 --s 7 --trainable-s \
# --exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config center_single --epochs 50 --s 7 --trainable-s \
 --exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN --num-workers $WORKERS --batch-size $BATCH_SIZE

# 2x2
#python raven/main_nvsa_marg.py --mode train --config distribute_four --epochs 150 --s 6 --trainable-s \
#--exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config distribute_four --epochs 150 --s 6 --trainable-s \
--exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN

# 3x3
#python raven/main_nvsa_marg.py --mode train --config distribute_nine --epochs 150 --s 2 --trainable-s --batch-size $BATCH_SIZE \
#--exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config distribute_nine --epochs 150 --s 2 --trainable-s --batch-size $BATCH_SIZE \
--exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN

# Left-right
#python raven/main_nvsa_marg.py --mode train --config left_center_single_right_center_single --epochs 100 --s 5 --trainable-s \
#--exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config left_center_single_right_center_single --epochs 100 --s 5 --trainable-s \
--exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN

# Up-down
#python raven/main_nvsa_marg.py --mode train --config up_center_single_down_center_single --epochs 100 --s 5 --trainable-s \
#--exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config up_center_single_down_center_single --epochs 100 --s 5 --trainable-s \
--exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN

# Out-in center
#python raven/main_nvsa_marg.py --mode train --config in_center_single_out_center_single --epochs 100 --s 5 --trainable-s \
#--exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config in_center_single_out_center_single --epochs 100 --s 5 --trainable-s \
--exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN

# Out-in grid
#python raven/main_nvsa_marg.py --mode train --config in_center_single_out_center_single --epochs 100 --s 5 --trainable-s \
#--exp_dir $EXPPATH --dataset $DATAPATH --dataset-i-raven $DATAPATHIRAVEN  --seed $SEED --run $RUN
python raven/main_nvsa_marg.py --mode train --config in_center_single_out_center_single --epochs 100 --s 5 --trainable-s \
--exp_dir $EXPPATH --dataset $DATAPATH --seed $SEED --run $RUN
