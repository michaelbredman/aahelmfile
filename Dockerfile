FROM harness/delegate:22.10.77029.minimal
USER root
RUN microdnf update
RUN microdnf install --nodocs unzip yum-utils wget
#RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
#RUN microdnf install -y terraform
RUN mkdir /opt/harness-delegate/tools && cd /opt/harness-delegate/tools
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl
RUN mv kubectl /opt/harness-delegate/tools/
RUN wget https://github.com/helmfile/helmfile/releases/download/v0.150.0/helmfile_0.150.0_linux_amd64.tar.gz
RUN tar -xvf helmfile_0.150.0_linux_amd64.tar.gz
RUN mv helmfile /opt/harness-delegate/tools/
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN microdnf install git
ENV PATH=/opt/harness-delegate/tools/:$PATH