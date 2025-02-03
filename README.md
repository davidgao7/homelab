# My Homelab Setup

This repo contains all of the configuration and documentaion of my homelab.

I began working on this 📅 2025-02-02.

## Tooling

- k3s

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
