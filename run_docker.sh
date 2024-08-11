# Stop and remove any existing container with the name evilginx-container
docker stop evilginx-container 2>/dev/null || true
docker rm evilginx-container 2>/dev/null || true

# Run the container interactively with a bash shell
docker run -it \
  --network evilginx-network \
  --ip 192.168.100.10 \
  -v $(pwd)/phishlets:/phishlets \
  -v ~/.evilginx:/root/.evilginx \
  --name evilginx-container \
  evilginx-image \
  /bin/bash
