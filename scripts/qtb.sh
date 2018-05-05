#!/bin/bash
# initial idea: Florian Bruhin (The-Compiler)
# author: Thore Bödecker (foxxx0)

_proto_version=1
_ipc_socket=$(ls $(echo $TMPDIR)qutebrowser/ipc-*)
_qute_bin="/Applications/qutebrowser.app/Contents/MacOS/qutebrowser"

printf '{"args": [":open -w"], "target_arg": null, "protocol_version": %d, "cwd": "%s"}\n' \
   "${_proto_version}" \
   "${PWD}" | socat - UNIX-CONNECT:"${_ipc_socket}" 2>/dev/null || "$_qute_bin" "$@" 2>/dev/null &
