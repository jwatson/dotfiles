#!/bin/zsh

function eviscerateDerivedData
{
    local derivedDataPath="$HOME/Library/Developer/Xcode/DerivedData"
    rm -rf "$derivedDataPath"
    echo "Deleted $derivedDataPath"
}
