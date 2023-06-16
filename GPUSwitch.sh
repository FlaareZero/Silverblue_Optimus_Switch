#!/bin/bash

if [ "$1" == "-s" ]; then
    shift
    if [ "$1" == "intel" ]; then
        rpm-ostree kargs --replace=rd.driver.blacklist=nouveau=nouveau,nvidia,nvidia_drm,nvidia_uvm,nvidia_modeset && rpm-ostree kargs --delete=nvidia-drm-modeset=0  --delete=modprobe.blacklist=nouveau
        echo "La stringa è stata modificata con successo per il profilo 'intel'."
    elif [ "$1" == "hybrid" ]; then
        rpm-ostree kargs --replace=rd.driver.blacklist=nouveau,nvidia,nvidia_drm,nvidia_uvm,nvidia_modeset=nouveau && rpm-ostree kargs --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=0
        echo "La stringa è stata modificata con successo per il profilo 'hybrid'."
    else
        echo "Profilo non valido. Utilizzare 'intel' o 'hybrid'."
    fi
else
    echo "Devi specificare il profilo utilizzando l'opzione -s."
fi
