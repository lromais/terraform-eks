# Learn Terraform - Provision an EKS Cluster

configure o aws cli 

```shell
$ aws configure
AWS Access Key ID [None]: <YOUR_AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_AWS_SECRET_ACCESS_KEY>
Default region name [None]: <YOUR_AWS_REGION>
Default output format [None]: json
```

rode o comando abaixo pra iniciar

```shell
$ terraform init
Initializing modules...
Downloading terraform-aws-modules/eks/aws 9.0.0 for eks...
- eks in .terraform/modules/eks/terraform-aws-modules-terraform-aws-eks-908c656
- eks.node_groups in .terraform/modules/eks/terraform-aws-modules-terraform-aws-eks-908c656/modules/node_groups
Downloading terraform-aws-modules/vpc/aws 2.6.0 for vpc...
- vpc in .terraform/modules/vpc/terraform-aws-modules-terraform-aws-vpc-4b28d3d

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "template" (hashicorp/template) 2.1.2...
- Downloading plugin for provider "kubernetes" (hashicorp/kubernetes) 1.10.0...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.52.0...
- Downloading plugin for provider "random" (hashicorp/random) 2.2.1...
- Downloading plugin for provider "local" (hashicorp/local) 1.4.0...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

Terraform has been successfully initialized!
```

rode o comando abaixo pra provisionar 

```shell
$ terraform apply

# Output truncated...

Plan: 51 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

# Output truncated...

Apply complete! Resources: 51 added, 0 changed, 0 destroyed.

Outputs:

cluster_endpoint = https://A1ADBDD0AE833267869C6ED0476D6B41.gr7.us-east-2.eks.amazonaws.com
cluster_security_group_id = sg-084ecbab456328732
kubectl_config = apiVersion: v1
preferences: {}
kind: Config

clusters:
- cluster:
    server: https://A1ADBDD0AE833267869C6ED0476D6B41.gr7.us-east-2.eks.amazonaws.com
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01ETXdPVEU0TXpVeU1sb1hEVE13TURNd056RTRNelV5TWxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTThkClZaN1lmbjZmWm41MEgwL0d1Qi9lRmVud2dydXQxQlJWd29nL1JXdFpNdkZaeStES0FlaG5lYnR5eHJ2VVZWMXkKTXVxelBiMzgwR3Vla3BTVnNTcDJVR0ptZ2N5UVBWVi9VYVZDQUpDaDZNYmIvL3U1bWFMUmVOZTBnb3VuMWlLbgpoalJBYlBJM2JvLzFPaGFuSXV1ejF4bmpDYVBvWlE1U2N5MklwNnlGZTlNbHZYQmJ6VGpESzdtK2VST2VpZUJWCjJQMGd0QXJ3alV1N2MrSmp6OVdvcGxCcTlHZ1RuNkRqT1laRHVHSHFRNEpDUnRsRjZBQXpTUVZ0cy9aRXBnMncKb2NHakd5ZE9pSmpMb1NsYU9weDIrMTNMbHcxMDAvNmY4Q0F2ajRIbFZUZDBQOW5rN1UyK04xNSt5VjRpNjFoQgp3bHl4SXFUWEhDR0JvYmRNNE5VQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFIbEI3bGVMTnJYRXZnNksvNUdtR2s5Tlh4SUkKRDd0Y1dkTklBdnFka1hWK3ltVkxpTXV2ZGpQVjVKV3pBbEozTWJqYjhjcmlQWWxnVk1JNFJwc0N0aGJnajMzMwpVWTNESnNxSmZPUUZkUnkvUTlBbHRTQlBqQldwbEtaZGc2dklxS0R0eHB5bHovOE1BZ1RldjJ6Zm9SdzE4ZnhCCkI2QnNUSktxVGZCNCtyZytVcS9ULzBVS1VXS0R5K2gyUFVPTEY2dFVZSXhXM2RncWh0YWV3MGJnQmZyV3ZvSW8KYitSOVFDTk42UHRQNEFFQSsyQnJYYzhFTmd1M2EvNG9rN3lPMjZhTGJLdC9sbUNoNWVBOEdBRGJycHlWb3ZjVgpuTGdyb0FvRnVRMCtzYjNCTThUcEtxK0YwZ2dwSFptL3ZFNjh5NUk1VFlmUUdHeEZ6VEVyOHR5NHk1az0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
  name: eks_training-eks-TNajBRIF

contexts:
- context:
    cluster: eks_training-eks-TNajBRIF
    user: eks_training-eks-TNajBRIF
  name: eks_training-eks-TNajBRIF

current-context: eks_training-eks-TNajBRIF

users:
- name: eks_training-eks-TNajBRIF
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "training-eks-TNajBRIF"



region = us-east-2
```

## configurando o  kubectl

para configurar kubetcl, voce precisará do [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) e [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html).

rode o comando abaixo para configurar o kubeclt


```shell
$ aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)
```

rode o comando abaixo para ver a saida do terraform

```shell
$ terraform output
```

## Deploy e acesso ao Kubernetes Dashboard

espere o cluster subir para essa etapa 

### Deploy Kubernetes Metrics Server

The Kubernetes Metrics Server, usa um coletetor de metricas do cluster que pega CPU e memory usage


Faça o Download e unzip rodando esse comando

```shell
$ wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz
```

fazendo o deploy

```shell
$ kubectl apply -f metrics-server-0.3.6/deploy/1.8+/
```

verificar se o deploy foi feito

```shell
$ kubectl get deployment metrics-server -n kube-system
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
metrics-server   1/1     1            1           4s
```

### Deploy Kubernetes Dashboard

rode o comando para subir o dashboard

```shell
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

namespace/kubernetes-dashboard created
serviceaccount/kubernetes-dashboard created
service/kubernetes-dashboard created
secret/kubernetes-dashboard-certs created
secret/kubernetes-dashboard-csrf created
secret/kubernetes-dashboard-key-holder created
configmap/kubernetes-dashboard-settings created
role.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard created
rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
deployment.apps/kubernetes-dashboard created
service/dashboard-metrics-scraper created
deployment.apps/dashboard-metrics-scraper created
```

agora vamos navegar no dashboard na sua maquina(local)
abra o browser e rode o comando abaixo para parar rode  `CTRL + C`.

```shell
$ kubectl proxy
```

Voce pode acessar atraves desse link [here](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/).

```plaintext
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

## Authenticate the dashboard

Para usasr o dashboard do ks8 vc precisa provisionar o token 
usando `kubeconfig`  **isso não é opcional** . Documentação sobre [Kubernetes documentation](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#accessing-the-dashboard-ui).

gere o token em outro terminal (nao feche o processo do `kubectl proxy`).

```shell
$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')

Name:         service-controller-token-46qlm
Namespace:    kube-system
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: service-controller
              kubernetes.io/service-account.uid: dd1948f3-6234-11ea-bb3f-0a063115cf22

Type:  kubernetes.io/service-account-token

Data
====
ca.crt:     1025 bytes
namespace:  11 bytes
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6I...
```

Selecione "Token" no Dashboard GUI e copie e cole o token gerado no terminal 
agora será possivel acessar
[dashboard authentication screen](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/) 

