# Flux ODC Sample

This repo holds some example flux config that can be used to deploy ODC apps on top of a kubernetes cluster built with https://github.com/opendatacube/datacube-k8s-eks 

## Conventions

#. Each folder represents a kubernetes namespace
#. Each file should only deploy a single application
#. Deployments should be generic, and not customised to a specific organisation