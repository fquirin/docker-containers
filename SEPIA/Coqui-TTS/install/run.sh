#!/bin/bash
if [[ -z "$MODEL_NAME" ]]; then
	MODEL_NAME="tts_models/en/ljspeech/glow-tts"
fi
echo "Starting Coqui-TTS server with model: $MODEL_NAME"
if [[ ! -z "$NUM_THREADS" ]]; then
        export OMP_NUM_THREADS="$NUM_THREADS"
	echo "Threads: $NUM_THREADS"
fi
cd TTS
python3 TTS/server/server.py --model_name "$MODEL_NAME" --port 5002
