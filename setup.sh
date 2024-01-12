# Install k3sup
# https://github.com/alexellis/k3sup
curl -sLS https://get.k3sup.dev | sh
sudo install k3sup /usr/local/bin/

# Set required variables
export IP=PASTE_IP_HERE
export USERNAME=root
export K3S_VERSION=v1.29.0+k3s1

# Copy credential provider config into VM
ssh $USERNAME@$IP "mkdir /home/$USERNAME/.kube"
scp ./credential_provider_config.yaml $USERNAME@$IP:/home/$USERNAME/.kube/
# Copy ECR credential provider config into VM
ssh $USERNAME@$IP "mkdir /home/$USERNAME/.aws"
scp ./ecr-credential-provider $USERNAME@$IP:/home/$USERNAME/.aws/
# Make ecr-credential-provider executable
ssh $USERNAME@$IP "chmod +x /home/$USERNAME/.aws/ecr-credential-provider"

# Install K3s and pass configs into kubelet
k3sup install --ip $IP --user $USERNAME --k3s-version $K3S_VERSION --k3s-extra-args "--node-external-ip $IP --image-credential-provider-config /home/$USERNAME/.kube/k8s_credential_provider_config.yaml --image-credential-provider-bin-dir /home/$USERNAME/.aws"
