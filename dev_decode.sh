#!/bin/bash

source activate py3torch3cuda9

dev_file="data/conala/dev.var_str_sep.bin"

python exp.py \
    --cuda \
    --mode test \
    --load_model $1 \
    --beam_size 15 \
    --test_file ${dev_file} \
    --evaluator conala_evaluator \
    --save_decode_to decodes/conala/$(basename $1).dev.decode \
    --decode_max_time_step 100