# Voting-App Simple DevOps Project

## Project Definition
1. Python: voting-app (User select an option)
2. Redis: in-memory DB (The selection is sent to redis)
3. .NET: worker (updates the persistant DB)
4. PostgreSQL: DB (persistant DB is updated)
5. node.JS: result-app (displays up-to-date results)

## Project Installation
### 1. Install Docker Environment
```
docker run -d --name=redis redis
docker run -d --name=db postgres:9.4
docker run -d --name=vote -p 5000:80 --link redis:redis voting-app
docker run -d --name=result -p 5001:80 --link db:db result-app
docker run -d --name=worker --link db:db --link redis:redis worker
```

### 2. Deploy in Kubernetes
1. Create PODs
   - redis-pod.yaml
   - postgres-pod.yaml
   - voting-app-pod.yaml
   - result-app-pod.yaml
   - worker-pod.yaml

2. Create Services
   1. ClusterIP: 
      - redis-service.yaml
      - postgres-service.yaml
   2. NodePort
      - voting-app.yaml
      - result-app.yaml

3. External Access
   - Check if there is any running pods or services: `kubectl get pods`
   - Check if there is any running services: `kubectl get svc`
   <br><br>
   - Create voting-app pod: `kubectl create -f voting-app-pod.yaml`
   - Create voting-app service: `kubectl create -f voting-app-service.yaml`
   - Check the running pods and services: `kubectl get pods,svc`
   <br><br>
   - See the URL of the service: `minikube service voting-service --url`
   - Visit the URL on browser to check whether the service works!
   <br><br>
   - Create redis pod: `kubectl create -f redis-pod.yaml`
   - Create redis service: `kubectl create -f redis-service.yaml`
   - Check the running pods and services: `kubectl get pods,svc`
   <br><br>
   - Create postgres pod: `kubectl create -f postgres-pod.yaml`
   - Create postgres service: `kubectl create -f postgres-service.yaml`
   - Check the running pods and services: `kubectl get pods,svc`
   <br><br>
   - Create worker pod: `kubectl create -f worker-pod.yaml`
   - Check the running pods and services: `kubectl get pods,svc`
   <br><br>
   - Create result-app pod: `kubectl create -f result-app-pod.yaml`
   - Create result-app service: `kubectl create -f result-app-service.yaml`
   - Check the running pods and services: `kubectl get pods,svc`
