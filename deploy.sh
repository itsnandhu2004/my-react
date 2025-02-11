#!/bin/bash
# Print a message indicating the start of the process
echo "Running deployment process..."

# Grant execute permissions to the build script
chmod 777 build.sh

# Run the build script
./build.sh

# Log in to Docker using the credentials
docker login -u nandhini1694 -p dckr_pat_08XhH0G6oTntx5pCb0hPNQVtQ1k

# Tag the Docker image with your repository
docker tag port nandhini1694/portfolio

# Push the image to Docker Hub
docker push nandhini1694/portfolio


