#!/bin/bash

ECLIPSE="/Applications/eclipse/eclipse"
REPOGIT="https://github.com/BodySplash/Eclipse-settings.git"
GROUP_ARCHETYPE="fr.arpinum"
ARTIFACT_ARCHETYPE="kata"
NOM_PROJET=$1
WORKSPACE=$PWD"/workspace"

function assure_presence_parametre() {
   if [ $# -ne 1 ]
   then
       echo "Usage: `basename $0` {nomKata}"
       exit 65
   fi
}

function creer_workspace () {
	git clone $REPOGIT $WORKSPACE
}

function ouvrir_eclipse () {
	$ECLIPSE -data $WORKSPACE &
}

function creer_projet () {
        cd $WORKSPACE
	mvn archetype:generate -DgroupId=fr.arpinum -DartifactId=$NOM_PROJET -Dversion=1.0.0-SNAPSHOT -DarchetypeGroupId=$GROUP_ARCHETYPE -DarchetypeArtifactId=$ARTIFACT_ARCHETYPE -DinteractiveMode=false
	cd ..
}

assure_presence_parametre $@                        
creer_workspace
creer_projet
ouvrir_eclipse
