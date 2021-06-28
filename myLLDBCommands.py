def __lldb_init_module(debugger, internal_dict):
  debugger.HandleCommand('command script add -h "Return the current apps bundle identifier" -f myLLDBCommands.getBundleIdentifier bundleId')

def getBundleIdentifier(debugger, command, result, internal_dict):
  target = debugger.GetSelectedTarget()
  process = target.GetProcess()
  mainThread = process.GetThreadAtIndex(0)
  currentFrame = mainThread.GetSelectedFrame()
  bundleIdentifier = currentFrame.EvaluateExpression\
                ("Bundle.main.bundleIdentifier!")\
                .GetObjectDescription()
  result.AppendMessage(bundleIdentifier) 
