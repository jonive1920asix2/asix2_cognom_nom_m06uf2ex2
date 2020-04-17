#!/bin/bash

check_root ()
{
	if  [ "$(id -u)" != "0" ]; then
	echo "Executa aquest script com a root."
	exit 2
	fi
}

check_dir ()
{
	clear
	read -p "Introdueix el nom d'un arxiu dins del directori /etc" dir
	cp /etc/$dir /etc/$dir.orig
	tar -czvf $dir.tar.gz /etc/$dir
	ls /etc | grep $dir
	torna_intentar
}

torna_intentar ()
{
	read -p "Vols continuar? (0 per tornar a intentar)" answ

	case $answ in

	0)
	check_dir
	;;

	!0)
	echo "Fins aviat"
	;;
	esac
}

check_root
check_dir

exit 0
