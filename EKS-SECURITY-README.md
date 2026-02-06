# EKS Security Enhancement - API Endpoint Access Control

This change addresses the Snyk security finding SNYK-CC-TF-94 regarding the public exposure of the EKS cluster API endpoint.

## Issue Description

The original configuration allowed unrestricted public access to the EKS API endpoint, which poses a security risk by potentially allowing unauthorized access to the Kubernetes control plane.

## Changes Made

1. Added `public_access_cidrs` parameter to the EKS cluster configuration to restrict which IP addresses can access the public API endpoint.
2. Created default configuration in `eks-security.auto.tfvars` that restricts access to example private IP ranges.

## How to Customize

You have two options to secure your EKS API endpoint:

### Option 1: Restrict public access to specific IP ranges (Recommended)

Edit the `eks-security.auto.tfvars` file and replace the example CIDR blocks with your actual trusted IP ranges:

```hcl
endpoint_public_access = true
endpoint_private_access = true
public_access_cidrs = [
  "203.0.113.0/24",  # Your corporate office IP range
  "198.51.100.0/24"  # Your VPN IP range
]
```

### Option 2: Disable public access completely

If you don't need public access to the EKS API endpoint, you can disable it by setting:

```hcl
endpoint_public_access = false
endpoint_private_access = true
```

This will restrict access to the API server to only within the VPC.

## Notes

- When `endpoint_public_access = false`, you'll need to have access to the VPC (via VPN, bastion host, etc.) to communicate with the EKS control plane.
- Keeping `endpoint_private_access = true` ensures you can still access the API server from within the VPC.
- The default configuration in `eks-security.auto.tfvars` uses example private IP ranges and should be updated with your actual trusted IP ranges.