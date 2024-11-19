Deploy Prometheus on Minikube with ArgoCD Using a Helm Chart from GitHub.
 
 Prerequisites
 1.    Minikube: Ensure Minikube is installed and running.
 2.    kubectl: Make sure kubectl is set up to access your Minikube cluster.
 3.    Helm: Install Helm for managing Helm charts.
 4.    ArgoCD: Install ArgoCD in your Minikube cluster.
 
 
 Steps:
 
 Step 1: Install ArgoCD
 1.    Create a namespace for ArgoCD:
 kubectl create namespace argocd
 2.    Install ArgoCD:
 kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
 # This particular YAML file (install.yaml) contains the necessary configuration to install Argo CD (a continuous delivery tool for Kubernetes) into your cluster.
 3.    Expose the ArgoCD API server:
 minikube service argocd-server -n argocd
 OR
 kubectl port-forward svc/argocd-server -n argocd 8080:443
 4.    Retrieve the initial admin password:
 username: admin
 password: kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode; echo
 
 
 Step 2: Prepare your Prometheus Git Repository.
 
 1.    Add the Prometheus Helm Chart Repository:
 This command adds the Prometheus Community Helm chart repository to your local Helm configuration.
 helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
 helm repo update
 
 2.    Download the Prometheus Chart:
 Use the helm pull command to download the chart:
 This command tells Helm to download the Prometheus chart from the prometheus-community repository.
 helm pull prometheus-community/prometheus --untar
 This command creates a directory called prometheus containing the Helm chart files.
 
 3.    Navigate to the downloaded chart directory:
 cd prometheus
 
 4.    Initialize a Git repository:
 git init
 
 5.    Add a remote GitHub repository:
 git remote add origin https://github.com/<your-username>/<your-repo>.git
 Replace <your-username> and <your-repo> with your actual GitHub username and repository name.
 
 6. Add and Commit the Helm Chart
 git add . (Add the files to git)
 git commit -m "Add official Prometheus Helm chart" (commit your changes)
 git push -u origin master (push the changes to github)
 If your default branch is main, use main instead of master.
 
 
 Step 3: Create an ArgoCD Application
 An Argo CD Application is a resource within Argo CD that represents a Kubernetes application you want to deploy and manage.
 1. Create a YAML file for the ArgoCD application  prometheus-app.yaml
  
 2. Create the monitoring namespace:
 kubectl create namespace monitoring
 
 3. Apply the ArgoCD application configuration:
 kubectl apply -f prometheus-app.yaml
 
 
 Step 4: Sync the Application
 1.    Go to the ArgoCD UI (http://localhost:8080).
 2.    Log in with the username admin and the password retrieved earlier.
 3.    Locate the Prometheus application and click the sync button to deploy it.
 
 Step 5: Access Prometheus
 1.    Forward the Prometheus service to your local machine:
 minikube service prometheus-server -n monitoring
