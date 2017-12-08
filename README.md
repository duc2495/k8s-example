# Create namespaces

kubectl create namespace spring-app

# Create PV

kubectl create -f nfs-postgres-pv.yaml

# Create Deployment postgres database

kubectl create -f postgres-deployment.yaml

# Create schema and tables with survey-db.sql
	1. Access to pod postgres and login with default pass=duc2495
	psql -d hrs-training -U duc2495 -W
	2. Copy the contents of the file survey-db.sql to the terminal and press Enter

# Create Deployment suyver appku	

kubectl create -f survey-deployment.yaml --record

# Access to app with url: [IP-Node-Master]:30303/SpringMVC/

# Update image from duc2495/surveyapp:v1.0 to duc2495/surveyapp:v1.1

kubectl set image deployment/survey-app survey-app=duc2495/surveyapp:v1.1 -n spring-app

# See rollout status 

kubectl rollout status deployment/survey-app -n spring-app

# See deployment 

kubectl get deployment -n spring-app

# Check the revisions of this deployment

kubectl rollout history deployment/survey-app -n spring-app

# Rollback to a specific revision by specify that in --to-revision

kubectl rollout undo deployment/survey-app -n spring-app --to-revision=1

# Scale Deployment survey-app from 2 to 3 replicas

kubectl scale deployment survey-app --replicas=3 

# Autoscaler choose the minimum=2 and maximum=5 of Pods, run based on the CPU utilization

kubectl autoscale deployment survey-app --min=2 --max=5 --cpu-percent=80 -n spring-app

while true; do curl 192.168.10.1:30303/SpringMVC/; done

# Check status of autoscaler
kubectl get hpa -n spring-app 
