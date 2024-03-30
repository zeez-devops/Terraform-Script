provider "aws" {
  region = var.region
}
aws-access-key-id = ${{ secrets.AWS_ACCESS_KEY_ID }}
aws-secret-access-key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
aws-region = ${{ env.AWS_REGION }}


provider "random" {
}

# get EKS authentication for being able to manage k8s objects from terraform
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}