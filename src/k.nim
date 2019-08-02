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
var command = ""


# if paramCount == 2, then kubectl -n [namespace] get [resource]
if (paramCount == 2):
  resource = paramStr(2)
  command = "kubectl -n " & namespace & " get " & resource
else:
  let operation = paramStr(2);
  case operation
    of "fwd":
      command = "kubectl -n " & namespace & " port-forward " & arguments(3)
    of "logs":
      command = "kubectl -n " & namespace & " logs " & arguments(3)


exec(command)