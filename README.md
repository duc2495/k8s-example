# 1. Create namespaces

kubectl create namespace spring-app

# 2. Create PV

kubectl create -f nfs-postgres-pv.yaml

# 3. Create Deployment PostgreSQL database
	3.1. Create a Secret for PostgreSQL Password
	kubectl create -f ./password.yaml
	3.2. Deploy PostgreSQL
	kubectl create -f postgres-deployment.yaml

# 4. Create tables with survey-db.sql
	4.1. Access to pod postgres and login with default pass=duc2495
	psql -d hrs-training -U duc2495 -W
	4.2. Copy the contents of the file survey-db.sql to the terminal and press Enter

# 5. Create Deployment survey app	

kubectl create -f survey-deployment.yaml --record

- Access to app with url: 

[IP-Node-Master]:30303/SpringMVC/

# 6. Update image from duc2495/surveyapp:v1.0 to duc2495/surveyapp:v1.2

kubectl set image deployment/survey survey=duc2495/surveyapp:v1.2 -n spring-app

- See rollout status 

kubectl rollout status deployment/survey -n spring-app

- See deployment 

kubectl get deployment -n spring-app

- Check the revisions of this deployment

kubectl rollout history deployment/survey -n spring-app

# 7. Rollback to a specific revision by specify that in --to-revision

kubectl rollout undo deployment/survey -n spring-app --to-revision=1

# 8. Scale Deployment survey-app with 3 replicas

kubectl scale deployment survey --replicas=3 -n spring-app

# 9. Autoscaler choose the minimum=1 and maximum=5 of Pods, run based on the CPU utilization

kubectl autoscale deployment survey --min=1 --max=5 --cpu-percent=60 -n spring-app

# 10. Check status of autoscaler

kubectl get hpa -n spring-app

while true; do curl localhost:8080/SpringMVC/; done

# 11. Pause Deployment

kubectl rollout pause deployment/survey -n spring-app

# 12. StatefulSet test
kubectl apply -f survey-statefulset.yaml --record
kubectl get statefulset survey -n spring-app
kubectl get pods -n spring-app
kubectl scale sts survey --replicas=3 -n spring-app
kubectl patch sts survey -p '{"spec":{"replicas":2}}' -n spring-app
