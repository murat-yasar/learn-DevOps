kubectl create -f pod.yaml       # Create a pod from a yaml file. -f: from the file
kubectl apply -f pod.yaml        # Applies a configuration from a YAML file
kubectl get pods                 # List all pods
kubectl describe pod nginx       # Get the detailed information about a pod

kubectl run nginx --image=nginx  # Create a new pod using the nginx image
kubectl get pods -o wide         # Check which nodes are these pods placed on

kubectl delete pod webapp        # Delete the webapp pod

# Create a new pod with the name redis and the image redis123
kubectl run redis --image=redis123 --dry-run=client -o yaml > redis-definition.yaml
kubectl create -f redis-definition.yaml
kubectl edit pod redis                          # Update the image of the pod to redis
kubectl apply -f redis-definition.yaml          # Update the image

# Replication Controller
kubectl create -f replica-controller.yaml       # Create myapp-rc replicationcontroller
kubectl get replicationcontroller               # List replicas

# Replicasets
kubectl create -f replicaset.yaml               # Create myapp-rc replicaset
kubectl get replicaset                          # List replicasets
kubectl replace -f replicaset.yaml              # Update the replicaset
kubectl scale --replicas=6 -f replicaset.yaml   # Scale the replicaset
kubectl scale rs new-replica-set --replicas=2   # Scale the replicaset to 2 pods
kubectl delete pod <pod-name>                   # Delete <pod-name> pod
kubectl delete replicaset <replicaset-name>     # Delete <replicaset-name> replicaset
kubectl edit replicaset <replicaset-name>       # Edit the replicaset   

# Deployments
kubectl create -f deployment.yaml               # Create a deployment
kubectl get deployments                         # List deployments
kubectl get pods                                # List the pods
kubectl describe deployment myapp-deployment    # Get the details of a deployment
kubectl explain deployment | head -n3           # Gets the error for the deployment

# Rollouts
kubectl apply -f deployment-definition.yaml                       # Apply the new deployment
kubectl apply -f deployment-definition.yaml --record              # Apply the new deployment keeping track of the change reasons
kubectl set image deployment/myapp-deployment nginx=nginx:1.9.1   # Set the image of the deployment
kubectl rollout status deployment/myapp-deployment                # See the status of the deployment
kubectl rollout history deployment/myapp-deployment               # Check the history of the deployment
kubectl rollout undo deployment/myapp-deployment                  # Roll-back to a deployment operation
