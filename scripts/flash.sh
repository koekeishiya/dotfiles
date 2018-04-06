id=$(chunkc tiling::query --window id)
sleep 0.01
CHUNKC_SOCKET=5050 chunkc window_alpha $id 0.5
sleep 0.01
CHUNKC_SOCKET=5050 chunkc window_alpha_fade $id 1.0 0.25
