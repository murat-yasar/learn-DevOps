# Voting-App Simple DevOps Project

## 0. Project Details
1. Python: voting-app (User select an option)
2. Redis: in-memory DB (The selection is sent to redis)
3. .NET: worker (updates the persistant DB)
4. PostgreSQL: DB (persistant DB is updated)
5. node.JS: result-app (displays up-to-date results)

## 1. Install Docker Environment
- 'docker run -d --name=redis redis'
- 'docker run -d --name=db postgres:9.4'
- 'docker run -d --name=vote -p 5000:80 --link redis:redis voting-app'
- 'docker run -d --name=result -p 5001:80 --link db:db result-app'
- 'docker run -d --name=worker --link db:db --link redis:redis worker'

## Deploy in Kubernetes
1. Deploy Containers (Create PODs)
2. Enable Connectivity (Create Services)
   1. ClusterIP
      - redis
      - db
   2. NodePort
      - voting-app
      - result-app
3. External Access      --> 