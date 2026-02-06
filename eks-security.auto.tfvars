# EKS Security Settings
# Restricting public access to EKS API server to specific IP ranges
# Replace the example CIDR block with your actual IP ranges (e.g., your corporate network)
endpoint_public_access = true
endpoint_private_access = true
public_access_cidrs = [
  "192.168.0.0/16",  # Example: Replace with your actual corporate network CIDR
  "10.0.0.0/8"       # Example: Replace with your VPN or trusted networks
]

# Alternative option: Set endpoint_public_access = false to disable public API access completely
# endpoint_public_access = false