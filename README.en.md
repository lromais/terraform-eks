# Learn Terraform - Provision an EKS Cluster

1) configure your credential using aws cli 

```shell
$ aws configure
AWS Access Key ID [None]: <YOUR_AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_AWS_SECRET_ACCESS_KEY>
Default region name [None]: <YOUR_AWS_REGION>
Default output format [None]: json
```

2) Into folder this directory run terraform init to inicialize 

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

3) Run terraform apply to create the entire infrastructure in your AWS account

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
  name: develop-eks-TNajBRIF

contexts:
- context:
    cluster: develop-eks-TNajBRIF
    user: develop-eks-TNajBRIF
  name: develop-eks-TNajBRIF

current-context: develop-eks-TNajBRIF

users:
- name: develop-eks-TNajBRIF
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "develop-eks-TNajBRIF"



region = us-east-2
```

## Configure kubectl

***To configure kubetcl, you will need [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) and [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html).***

1) Run this command below to confgure kubectl


```shell
$ aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)
```


## Deploy and access the Kubernetes Dashboard

Make sure that the previous steps have been completed to run from here
Now that the cluster initialization process has been completed, let's continue with the configuration of the dashboard 


### Deploy Kubernetes Metrics Server

The Kubernetes Metrics Server, uses a cluster metrics collector that takes CPU and memory usage


1) Download and unzip by running this command

```shell
$ wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz
```

2) make deploy metrics-server

```shell
$ kubectl apply -f metrics-server-0.3.6/deploy/1.8+/
```

3) Check your deploy metrics-server is done 

```shell
$ kubectl get deployment metrics-server -n kube-system
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
metrics-server   1/1     1            1           4s
```

### Deploy Kubernetes Dashboard

turn the command to move up the dashboard

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

now let's navigate the dashboard on your machine (local)
open the browser and run the command below to stop run  `CTRL + C`.

```shell
$ kubectl proxy
```

You can access it through this link [here](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/).

```plaintext
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

## Authenticate the dashboard

To use the ks8 dashboard you need to provision the token
using `kubeconfig` ***this is not optional***. Documentation on [Kubernetes documentation](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#accessing-the-dashboard-ui).

generate the token in another terminal (do not close the process`kubectl proxy`).

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

Select "Token" in the Dashboard GUI and copy and paste the generated token into the terminal
now it will be possible to access
[dashboard authentication screen](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/) 

