# Composing LLamas
===
llama.cpp as "raw" inference engine; 
specifically tailored to be run containerized via docker-compose on the NVIDIA  platform.

Required: docker; docker compose; nvidia container toolkit (see https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Configure:
Models are to be saved as GGUF files in the volume configured in docker-compose.yml

Commands:
Start the container: 
docker compose --build up -d
Stop container:
docker compose down