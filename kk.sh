
CLUSTER="."
KUBECONFIGS="${HOME}/.kube/conf.d"

[[ $# > 0 ]] && CLUSTER="kubeconfig-$1"

if [ ! -d "${KUBECONFIGS}" ]; then
    echo "Conf directory is not created: ${KUBECONFIGS}. I will do that for you. Just put all your configs there after that ;)."
    mkdir "${KUBECONFIGS}"
    return
fi

# select cluster config file
CONFIG_FILE="${KUBECONFIGS}/${CLUSTER}.yaml"

if [ ! -f "${CONFIG_FILE}" ]; then

    CONFIG_FILES=$(ls -l ${KUBECONFIGS}/ | awk '{ print $9 }' | grep ${CLUSTER} | grep -v '^$' )
    check=`echo $CONFIG_FILES | grep ${CLUSTER} | wc -w `

    if [ $check -gt 1 ]; then
      echo -e "\n${check//[[:blank:]]/} matches found for \"$CLUSTER\", please refine your search: \n"
      echo "CONFIG NAME:"
      echo "------------"

      echo -e "$CONFIG_FILES\n" | sed 's/.yaml//g' | sed 's/kubeconfig-//g'
      return
    else
      echo "no match found for $CLUSTER" | sed 's/kubeconfig-//g'
      return
    fi
fi

if [[ $# > 0 ]]; then
  export KUBECONFIG=$CONFIG_FILE
  echo "Config '$CLUSTER' set" | sed 's/kubeconfig-//g'

  # set persistent default config
  cp $CONFIG_FILE $HOME/.kube/config
fi