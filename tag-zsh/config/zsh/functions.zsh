#!/bin/zsh

function eviscerateDerivedData
{
    local derivedDataPath="$HOME/Library/Developer/Xcode/DerivedData"
    rm -rf "$derivedDataPath"
    echo "Deleted $derivedDataPath"
}

function purgeZeroLengthFilesInDerivedData
{
  find ~/Library/Developer/Xcode/DerivedData -name "*.o" -size 0 | xargs rm
}
