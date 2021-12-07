# POC-EKS-Orchestration
POC around the setup of a Kubernetes cluster on AWS cloud and managing applications on Kubernetes.
Objectives:
1) Basic VPC setup for a Kubernetes cluster on AWS using Terraform
2) EKS cluster setup using eksctl
3) Stateless & Stateful workload on Kubernetes
4) Metrics system for Kubernetes
5) Autoscaling nodes & workload on Kubernetes

The work has been sub-divided into below categories:
  1)  Initialize a bucket in AWS s3 for a backend state store using Terraform.
  2)  Infrastructure provisioning using Terraform on AWS and tagging the public and private subnets according to AWS EKS subnet tagging requirement.
  3)  Setting up EKS cluster using eksctl.
  4)  Dockerize the node-js application and push the image to a created ECR repository.
  5)  Create a nodegroup using eksctl which should have a taint on nodes.
  6)  Creating a Kubernetes deployment,service & ingress for node-js application on the cluster such that the deployment has toleration for the taint given to the created nodegroup. The deployment uses the docker image pushed to the ECR repository.
  7)  Deploying a Stateful application/service using statefulset and attaching a disk for storing state.
  8)  Deploy a single redis pod. This pod has redis-cli installed which we can use to run commands on redis-server.
  9)  Creating Kubernetes-metrics server - for exposing CPU/Memory metrics of pods & nodes.
  10)  Ensuring that application is able to scale well automatically in case of a surge in usage using the concept of Horizontal Pod Autoscaler for handling scale up/down of      deployment & statefulsets.

Note: We can test the scaling actions by simulating requests to the application using Apache Benchmark (ab) tool.
  
  
  
