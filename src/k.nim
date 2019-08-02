import osproc
include helpers

setControlCHook(ctrlc)
let paramCount = paramCount()

# we need at least the namespace
if (paramCount < 1):
  echo "Too few arguments, k8s namespace is required."
  echo ""
  help()

let namespace = paramStr(1)
var resource = "po"
var command = "kubectl -n " & namespace


if (paramCount > 2):
  let operation = paramStr(2);
  resource = operation;
  case operation
    of "fwd":
      command &= " port-forward " & arguments(3)
    of "logs":
      command &= " logs " & arguments(3)
    else:
      command &= " get " & resource & " " & arguments(3)
else:
  if (paramCount == 2):
    resource = paramStr(2)
  command &= " get " & resource

exec(command)
