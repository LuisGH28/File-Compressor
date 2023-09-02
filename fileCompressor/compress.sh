#author: Luis Gonzalez
#Date: September 01 2023
: ' Description: the following script can help you
to look for archives has the same extension and after
compress it '

#!/bin/bash

directory="here put the directory path"
extension="here put the extension of the archive that u wanna compress, example 'c' "           
nameZip="here u put the name zip archive"

if [ -d "$directory" ]; then
    archives=("$directory"/*.$extension)
    
    if [ ${#archives[@]} -gt 1 ]; then
        echo "Los archivos en el directorio '$directory' con extensión '$extension' son:"
        for archive in "${archives[@]}"; do
            echo "$(basename "$archive")"
            zip "$nameZip" "$archive"
        done

    else
        echo "No se encontraron archivos con la extensión '$extension' en el directorio '$directory'."
    fi
else
    echo "El directorio '$directory' no existe."
fi
