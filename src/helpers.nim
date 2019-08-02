import os
import streams
include version

# Prints the usage screen
proc help() =
  let fileName: string = extractFilename(getAppFileName())
  echo fileName & " version: " & VERSION
  echo "Usage:"
  echo "  ", fileName, " <namespace> [[operation] <resource> [args]]"
  echo "  default operation: get"
  echo "  default resource: po"
  quit 1

proc arguments(start: int): string =
  var arguments = paramStr(start)
  for i in (start + 1)..paramCount():
    arguments &= " " & paramStr(i)
  return arguments

proc read(ous: Stream) =
  var line: string
  while true:
    line = string(ous.readLine())
    echo line

proc exec(command: string) =
  let p = startProcess(command, options={poStdErrToStdOut, poEvalCommand})
  defer: p.close
  try:
    read(p.outputStream)
  except:
    return

proc ctrlc() {.noconv.} =
  return
