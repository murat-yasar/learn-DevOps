##################################
### Cluster & Node Management ###
##################################

kubectl cluster-info    # Display cluster information
kubectl get nodes       # List all nodes in the cluster
kubectl describe nodes  # Show detailed information about nodes
kubectl top nodes       # Display resource usage of nodes



######################
### Pod Operations ###
######################

kubectl get pods                          # List all pods in the current namespace
kubectl get pods -A                       # List all pods in all namespaces
kubectl describe pod <pod-name>           # Show detailed information about a specific pod
kubectl logs -f <pod-name>                # Stream logs from a specific pod
kubectl exec -it <pod-name> -- /bin/sh    # Execute a command in a running pod
kubectl delete pod <pod-name>             # Delete a specific pod



############################
### Deployment & Scaling ###
############################

kubectl get deployments                                           # List all deployments in the current namespace
kubectl get deployments -A                                        # List all deployments in all namespaces
kubectl describe deployment <deployment-name>                     # Show detailed information about a specific deployment
kubectl scale deployment <deployment-name> --replicas=<number>    # Scale a deployment
kubectl rollout status deployment/<deployment-name>               # Check the status of a deployment rollout
kubectl rollout history deployment <deploy-name>                  # View the rollout history of a deployment
kubectl rollout undo deployment <deployment-name>                 # Roll back to a previous deployment version
kubectl create deployment <deployment-name> --image=<image-name>  # Create a new deployment
kubectl delete deployment <deployment-name>                       # Delete a specific deployment



#############################
### Services & Networking ###
#############################

kubectl get services                                                       # List all services in the current namespace
kubectl get services -A                                                    # List all services in all namespaces
kubectl describe service <service-name>                                    # Show detailed information about a specific service
kubectl expose deployment <deployment-name> --type=NodePort --port=<port>  # Expose a deployment as a service
kubectl delete service <service-name>                                      # Delete a specific service
kubectl port-forward service/<service-name> <local-port>:<service-port>    # Forward a local port to a service
kubectl get endpoints <service-name>                                       # List endpoints for a specific service
kubectl get ingress -A                                                     # List all ingress resources in all namespaces
kubectl describe ingress <ingress-name>                                    # Show detailed information about a specific ingress resource
kubectl create ingress <ingress-name> --rule=<host>=<service>:<port>       # Create a new ingress resource
kubectl delete ingress <ingress-name>                                      # Delete a specific ingress resource



############################
### ConfigMaps & Secrets ###
############################

kubectl get configmaps                                         # Lists all ConfigMaps
kubectl create configmap <name> --from-file=file.properties    # Creates a ConfigMap from a file
kubectl get secrets                                            # Lists all secrets
kubectl create secret generic <name> --from-literal=key=value  # Creates a secret



##################
### Namespaces ###
##################

kubectl get namespaces                                      # Lists all namespaces
kubectl create namespace <ns-name>                          # Creates a new namespace
kubectl config set-context --current --namespace=<ns-name>  # Switches the current namespace



###########################
### Applying YAML Files ###
###########################

kubectl apply -f file.yaml    # Applies a configuration from a YAML file
kubectl delete -f file.yaml   # Deletes resources defined in a YAML file



####################################
### ADebugging & Troubleshooting ###
####################################

kubectl get events --sort-by=.metadata.creationTimestamp	   # Shows cluster events in order
kubectl top pod	                                          # Displays CPU/memory usage of pods
kubectl cp <pod-name>:/path/to/file ./local-path	         # Copies files from a pod to local
