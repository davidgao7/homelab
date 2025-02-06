# My Homelab Setup

This repo contains all of the configuration and documentaion of my homelab.

I began working on this 📅 2025-02-02.

## Tooling

- k3s (should be k8s since I'm not only using it locally)
- k9s for command line monitoring

## Goals

[!Note]
My goals for my kubernete clusters on AWS is for ML, also for my app services.
So I need this to be able to show my apps to internet, also I could build kubeflow pipelines

- Run Prometheus and Grafana stack
- Have Grafana dashboard available with a URL
    * ingress
    * tls
    * DNS
- Everything should be deployed using GitOps
    * FluxCD

## Log

### 2025-02-03

- setup base machine using Azure

### 2025-02-04

- setup terminal completion, neovim

### 2025-02-05

- setup k3s
- setup docs for each component
- add k3s documentaion
- change defualt commit editor from `nano` to `nvim`
- k9s for command line monitoring
