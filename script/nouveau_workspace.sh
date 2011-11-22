#!/bin/bash

ECLIPSE="/Applications/eclipse/eclipse"
REPOGIT="git@github.com:BodySplash/Eclipse-settings.git"
GROUP_ARCHETYPE="fr.arpinum"
ARTIFACT_ARCHETYPE="kata"
NOM_PROJET=$1
WORKSPACE="$PWD"

function creer_workspace () {
	git clone $REPOGIT ./
}

function ouvrir_eclipse () {
	$ECLIPSE -data $WORKSPACE &
}

function creer_projet () {
	mvn archetype:generate -DgroupId=fr.arpinum -DartifactId=$NOM_PROJET -Dversion=1.0.0-SNAPSHOT -DarchetypeGroupId=$GROUP_ARCHETYPE -DarchetypeArtifactId=$ARTIFACT_ARCHETYPE
}
                         
creer_workspace
creer_projet
ouvrir_eclipse
