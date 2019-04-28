#!/bin/bash
test_file="data/conala/test.var_str_sep.bin"
train_file="data/conala/train.var_str_sep.bin"
dev_file="data/conala/dev.var_str_sep.bin"

dev_decode_file=""
test_decode_file=""

python exp.py \
    --cuda \
    --mode rerank \
    --beam_size 15 \
    --evaluator conala_evaluator \
    --save_decode_to decodes/conala/reranker \
    --decode_max_time_step 100 \
    --train_file ${train_file} \
    --dev_file ${dev_file} \
    --test_file ${test_file} \
    --evaluator conala_evaluator \
    --asdl_file asdl/lang/py3/py3_asdl.simplified.txt \
    --lang python3 \
    --features reconstructor $1 normalized_parser_score \
    --dev_decode_file $2 \
    --test_decode_file $3

