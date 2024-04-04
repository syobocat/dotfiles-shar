#!/bin/sh

usage() {
	echo "Usage: ./dotfiles.sh [archive|install]"
}

if [ $# -ne 1 ]; then
	usage
	exit
fi

CDIR="$(dirname $0)"
MODULES="$(cat ${CDIR}/modules.conf)"
case "$1" in
	"archive" )
		for module in $MODULES
		do
			echo "Archiving ${module}..."
			${CDIR}/archive.sh "${module}" > ${CDIR}/archive/${module}.shar
		done
		echo "Done."
		;;
	"install" )
		for module in $MODULES
		do
			echo "Installing ${module}..."
			/bin/sh "${CDIR}/archive/${module}.shar"
		done
		echo "Done."
		;;
	* )
		usage
		;;
esac
