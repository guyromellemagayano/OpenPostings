Option Explicit

Dim shell
Dim filesystem
Dim scriptDirectory
Dim appDirectory
Dim openPostingsPath
Dim command

Set shell = CreateObject("WScript.Shell")
Set filesystem = CreateObject("Scripting.FileSystemObject")

scriptDirectory = filesystem.GetParentFolderName(WScript.ScriptFullName)
appDirectory = filesystem.GetParentFolderName(scriptDirectory)
openPostingsPath = filesystem.BuildPath(appDirectory, "openpostings.exe")

If Not filesystem.FileExists(openPostingsPath) Then
  WScript.Quit 0
End If

command = """" & openPostingsPath & """ --backend-startup"
shell.Run command, 0, False
