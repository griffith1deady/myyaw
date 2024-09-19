import std/[os, strformat, strutils]

let currentDirectory = getCurrentDir()
echo fmt"Current directory: {currentDirectory}"

let distDirectory = currentDirectory / "dist"
echo fmt"Dist directory: {distDirectory}"

for file in walkDirRec(distDirectory):
  var directoryName = file.parentDir().replace(distDirectory, "")
  if directoryName.len > 0 and directoryName[0] == '\\':
    directoryName = directoryName[1..^1]

  let fileName = file.extractFilename()
  echo fmt"File: {fileName} in {directoryName}"

  if fileExists(directoryName / fileName):
    removeFile(directoryName / fileName)

  if not dirExists(currentDirectory / directoryName):
    createDir(currentDirectory / directoryName)

  copyFile(distDirectory / directoryName / fileName, currentDirectory / directoryName / fileName)
  echo fmt"Copied {fileName}"

