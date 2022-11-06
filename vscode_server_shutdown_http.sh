#!/bin/bash

SHUTDOWN_TIME=1800
SLEEP_TIME=60
connection_not_established_time=0

while true; do
    sleep ${SLEEP_TIME}
    vscode_server_process=`ps -aux | grep "vscode-cli/server-stable-web" | grep "node" | awk '{print $2}'`
    connection_established_process=`netstat -anp | grep ESTABLISHED | grep node | awk '{print $7}'`
    is_connected=false
    for e_p_ in ${connection_established_process}; do
        for v_p_ in ${vscode_server_process}; do
            if [[ "${e_p_}" =~ "${v_p_}"  ]]; then
                # connection established process is pid/node.
                # confirm that established process contains vscoder server process (node).
                is_connected=true
            fi
        done
    done
    if [ ${is_connected}  == true ]; then
        connection_not_established_time=0
    else
        connection_not_established_time=$((${connection_not_established_time} + ${SLEEP_TIME}))
    fi
    if [ ${connection_not_established_time} -ge ${SHUTDOWN_TIME} ]; then
        echo "client did not connect to vscode server... bye bye.."
        shutdown -h now
    fi
done
