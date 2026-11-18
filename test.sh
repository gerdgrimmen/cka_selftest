kubectl get pod self001 &> /dev/null
task001=($?)
#echo $task001
if [ $task001 -eq 0 ]; then
        echo "self001 pod found"
else
        echo "self001 pod not found"
fi

kubectl get replicaset self002 &> /dev/null
task002=($?)
if [ $task002 -eq 0 ]; then
        echo "self002 replicaset found"
else
        echo "self002 replicaset not found"
fi

# implement tests for image and replicas
kubectl get deployment self003 &> /dev/null
task003=($?)
if [ $task003 -eq 0 ]; then
        echo "self003 deployment found"
else
        echo "self003 deployment not found"
fi

kubectl get deployments self003 -o=jsonpath=" {..image}" 2> /dev/null  | grep -e "nginx:latest" &> /dev/null
task003_01=($?)
if [ $task003_01 -eq 0 ]; then
        echo "self003 deployment image is nginx:latest"
else
        echo "self003 deployment image is not nginx:latest"
fi

kubectl get deployment self003 -o=jsonpath=" {..replicas}" 2> /dev/null | grep -e "2" &> /dev/null
task003_02=($?)
if [ $task003_02 -eq 0 ]; then
        echo "self003 deployment replicas are set to 2"
else
        echo "self003 deployment replicas are not set to 2"
fi

