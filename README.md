# VSCode Server Shutdown

This is a shellscript for automatically shutdown the VSCode server when there is no connection from the client like AWS cloud9.

If the client opens VSCode using a web browser, it will not be shut down. But if the browser（the page where VSCode is open) is closed, the server will be automatically shut down 30 minutes after it is closed.

## VSCode Server Shutdown for HTTP

- vscode_server_shutdown_http.sh

## VSCode Server Shutdown for SSH

- vscode_server_shutdown_ssh.sh
