#!/bin/bash

set -aux

OFRECORD_PATH="sample_seq_len_512_example"

CHECKPOINT_PATH="checkpoints"
if [ ! -d "$CHECKPOINT_PATH" ]; then
    mkdir $CHECKPOINT_PATH
fi

LEARNING_RATE=1e-4
EPOCH=10
TRAIN_BATCH_SIZE=2
VAL_BATCH_SIZE=2

python3 run_pretraining.py \
  --ofrecord_path $OFRECORD_PATH \
  --checkpoint_path $CHECKPOINT_PATH \
  --lr $LEARNING_RATE \
  --epochs $EPOCH \
  --train-batch-size $TRAIN_BATCH_SIZE \
  --val-batch-size $VAL_BATCH_SIZE \
  --seq_length=512 \
  --max_predictions_per_seq=80 \
  --num_hidden_layers=12 \
  --num_attention_heads=12 \
  --hidden_size=768 \
  --max_position_embeddings=512 \
  --type_vocab_size=2 \
  --vocab_size=30522 \
  --attention_probs_dropout_prob=0.1 \
  --hidden_dropout_prob=0.1 \