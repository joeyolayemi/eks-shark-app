## EKS Deployment

kubectl apply -f db-deployment.yaml \
  -f db-env-configmap.yaml \
  -f db-service.yaml \
  -f dbdata-persistentvolumeclaim.yaml \
  -f node-modules-persistentvolumeclaim.yaml \
  -f node-modules-pv.yaml \
  -f node-modules-pvc.yaml \
  -f nodejs-claim0-persistentvolumeclaim.yaml \
  -f nodejs-claim0.yaml \
  -f nodejs-deployment.yaml \
  -f nodejs-env-configmap.yaml \
  -f nodejs-pv.yaml \
  -f nodejs-service.yaml \
  -f pv.yaml \
  -f secret.yaml

### Reference
Project code for tutorial on integrating MongoDB into Node.js application using Mongoose: https://www.digitalocean.com/community/tutorials/how-to-integrate-mongodb-with-your-node-application

tutorial to convert to k8s yaml
https://www.digitalocean.com/community/tutorials/how-to-migrate-a-docker-compose-workflow-to-kubernetes