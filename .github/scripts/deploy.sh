
echo "Image Name: $IMAGE"
echo "App Name: $APP"

aws eks --region us-east-1 update-kubeconfig --name $AWS_CLUSTER_NAME

echo "Listing nodes"
kubectl get nodes

## Desplegar un Pod de nombre pod-2048 usando la imagen evilroot/docker-2048 y pasándole una etiqueta app=pod-2048
kubectl run $APP --image=$IMAGE -l app=$APP

## Exponer el pod usando un Service del tipo LoadBalancer. De esta forma, se crea un ALB directamente en AWS.
kubectl expose pod $APP --port=80  --name=svc-product-service --type=LoadBalancer

 ## Podemos validar que se haya creado el service y obtener la url del balanceador
kubectl get svc

kubectl get all
