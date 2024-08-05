#!/bin/bash
#To make the .sh file executable
#sudo chmod +x ./create_local_nuget.sh

# create local nuget directory, e.g.
# /Users/Martin/Development/nugets

# add the directory as a local nuget feed
# in /Users/Martin/.nuget/NuGet/NuGet.Config under <packageSources> add below line
#   <add key="localfeed" value="/Users/Martin/Development/nugets" />


#clear the local nuget cache
dotnet nuget locals all --clear

#build the nuget package project
dotnet build ../Models/Models.csproj

#create the nuget package
dotnet pack ../Models/Models.csproj -o ../Models

#publish the nuget package to local feed
dotnet nuget push ../Models/seedGenerator.1.0.0.nupkg -s /Users/Martin/Development/nugets