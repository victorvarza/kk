

Simple tool for kubeconfigs management. Advantages:
- you can connect to multiple clusters in the same time from different terminals
- save the latest cluster accessed, so new console tab can use that 
- switch bettwen namespace with kns

1. Create folder $HOME/.kube/conf.d and add all your kubeconfigs there as: kubeconfig-<cluster-name>.yaml

2. In .bash_profile (MacOS) or .bashrc add the following alias:
    ```
    export KUBECONFIG=$HOME/.kube/config
    alias kk="source ~/<PATH-TO-KK-REPO>/kk.sh"
    alias kns="~/<PATH-TO-KK-REPO>/kns.sh"
   ```

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


