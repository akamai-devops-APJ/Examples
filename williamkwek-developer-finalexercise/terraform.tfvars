# Replace XXXXX with your Linode Access Token
token      = "XXXXX"
k8s_label  = "mylke-k8s"
k8s_region = "ap-south"
tags       = ["mylke-k8s", "terraform"]
pools = [
  {
    type  = "g6-standard-1"
    count = 3
  }
]
