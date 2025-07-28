kubectl create -f pod.yaml       # Create a pod from a yaml file
kubectl apply -f pod.yaml        # Applies a configuration from a YAML file
kubectl get pods                 # List all pods
kubectl describe pod nginx       # Get the detailed information about a pod

kubectl run nginx --image=nginx  # Create a new pod using the nginx image
kubectl get pods -o wide         # Check which nodes are these pods placed on

kubectl delete pod webapp        # Delete the webapp pod

# Create a new pod with the name redis and the image redis123
kubectl run redis --image=redis123 --dry-run=client -o yaml > redis-definition.yaml
kubectl create -f redis-definition.yaml
kubectl edit pod redis                    # Update the image of the pod to redis
kubectl apply -f redis-definition.yaml    # Update the image