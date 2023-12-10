# Build container image karsajobs-ui frontend
docker build -t ghcr.io/f00ds/karsajobs-ui:latest .

# Login github container registry
echo $CR_ONLY | docker login ghcr.io -u USERNAME --password-stdin

# Push image to github container registry
docker push ghcr.io/f00ds/karsajobs-ui:latest