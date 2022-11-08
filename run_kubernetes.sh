
# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=soumitra016/udacity-ml-app

# Step 2
# Run the Docker Hub container with kubernetes
rpod=$(kubectl get pod udacity-ml-app 2> /dev/null;echo $?)
if [ "_$rpod" == "_1" ] ; then
        kubectl run udacity-ml-app \
        --image=$dockerpath \
        --image-pull-policy="Always" \
        --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "secretkey"}]}}'
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-ml-app 8080:80