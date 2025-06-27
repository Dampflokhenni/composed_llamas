# NVIDIA CUDA base image for ARM64
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04


# https://developer.nvidia.com/cuda-gpus
# Jetson Orin series: 87
ARG CUDA_ARCH=87

# Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git build-essential cmake && \
    rm -rf /var/lib/apt/lists/* 
    # remove apt lists to reduce image size

# Clone and build llama.cpp
WORKDIR /app
RUN git clone https://github.com/ggerganov/llama.cpp.git .
RUN cmake -B build -DLLAMA_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=${CUDA_ARCH}
# Build llama.cpp in Release mode for optimal performance
RUN cmake --build build --config Release 

# Server will run on port 8080, adjust if needed
EXPOSE 8080
WORKDIR /app/build/bin

# Default command (override in docker-compose.yml if needed))
CMD ["./server", "--help"] # llama.cpp server