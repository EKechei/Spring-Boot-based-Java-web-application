# Jenkins Pipeline for Java based application using Maven, SonarQube, Argo CD and Kubernetes

![image](https://github.com/user-attachments/assets/3768c63c-7c49-4dcf-98f1-97ae790a590e)

# Overview

This project showcases a CI/CD pipeline for a Java-based application. The pipeline is divided into two parts:

- **Continuous Integration (CI)**: Is managed by Jenkins, focusing on building, testing, and packaging the application.
- **Continuous Deployment (CD)**: Is handled by Argo CD, which deploys the application to a Kubernetes cluster using GitOps principles.

  
The setup ensures a streamlined, automated, and efficient development-to-deployment workflow.


# Features

- **Continuous Integration with Jenkins**: Automates the build and testing process using Maven and SonarQube.
- **Continuous Deployment with Argo CD**: Deploys the application to a Kubernetes cluster using GitOps.
- **Containerization**: Docker is used to build and ship application containers.
- **Code Quality Assurance**: SonarQube ensures code quality and security.
- **Scalable Deployments**: The application is deployed on Kubernetes, enabling scalability and resilience.


  
# Pipeline Workflow

# Continuous Integration (CI)
- **Source Code Management**: Jenkins pulls code from the GitHub repository.
- **Build and Package**: Maven compiles and packages the application into a JAR file.
- **Static Code Analysis**: Jenkins integrates with SonarQube to perform code quality checks.
- **Dockerization**: Jenkins builds a Docker image of the application and pushes it to Docker Hub.
  
# Continuous Deployment (CD)
- **GitOps Workflow**: Kubernetes manifests are stored in the GitHub repository.
- **Argo CD Synchronization**: Argo CD monitors the repository for changes and syncs the manifests with the Kubernetes cluster to deploy the application.


# Prerequisites
- **Jenkins**: Installed and configured with:
   - **GitHub Credentials**: For repository access.
   - **SonarQube Token**: For code quality analysis.
   - **Docker Hub Credentials**: To push Docker images.
- **SonarQube**: Running and accessible.
- **Docker**: Installed for building images.
- **Argo CD**: Installed on a Kubernetes cluster, monitoring the repository.
- **GitHub Repository**: For source code, pipeline configurations, and Kubernetes manifests.

# Setup and Execution
# Step 1: Clone the Repository
```
git clone https://github.com/<your-username>/<your-repo-name>.git

```
# Step 2: Run Locally
Build and run the application locally:

```
mvn clean package
java -jar target/spring-boot-web.jar

```
Access the application at http://localhost:8080.

# Step 3: Run with Docker
Build and run the application as a container:
```
docker build -t ultimate-cicd-pipeline:v1 .
docker run -d -p 8010:8080 ultimate-cicd-pipeline:v1

```
Access the application at http://localhost:8010.

# CI/CD Process
# Continuous Integration
1. **Configure Jenkins Pipeline**:

- Add the following credentials in Jenkins:
   - **GitHub**: For pulling code.
   - **SonarQube**: For static code analysis.
   - **Docker Hub**: For pushing the Docker image.
     
- Use the provided **Jenkinsfile** for pipeline setup.

2. **Run the Pipeline**:
- Push changes to the repository or manually trigger the pipeline from Jenkins.


# Continuous Deployment
1. **Set Up Argo CD**:
- Ensure Argo CD is monitoring the GitHub repository with the Kubernetes manifests.

2. **Deploy Application**:
- Once the Docker image is pushed, the **deployment.yaml** file is updated with the new image tag in the repository.
- Argo CD syncs the manifests with the cluster and deploys the updated application.


