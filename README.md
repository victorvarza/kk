

1. Create folder $HOME/.kube/conf.d and add all your kubeconfigs there
2. In .bash_profile (MacOS) or .bashrc add the following alias:
   alias kk="source <path to kk script>"
3. Example:

```
# kk
12 matches found for ".", please refine your search:

CONFIG NAME:
------------
alpha
alpha-dev
beta
beta-stage
beta-prod


# kk alpha
Config 'alpha' set
```


