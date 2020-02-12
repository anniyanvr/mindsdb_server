#!/bin/bash

"$PYPATH" -m pip install --user --upgrade pip
"$PYPATH" -m pip install --user virtualenv

mkdir -p "$SERVER_PATH" || mkdir "$SERVER_PATH"
cd "$SERVER_PATH"
"$PYPATH" -m virtualenv env --python="$PYPATH"
source env/bin/activate
env/bin/pip3 install --upgrade pip || env/bin/pip install --upgrade pip
env/bin/pip3 install mindsdb --upgrade --no-cache-dir || env/bin/pip install mindsdb --upgrade --no-cache-dir
env/bin/pip3 install mindsdb-server --upgrade --no-cache-dir || env/bin/pip install mindsdb-server --upgrade --no-cache-dir
echo "
from mindsdb_server import start_server
if __name__ == '__main__':
    start_server()
" > run_mindsdb_server.py
