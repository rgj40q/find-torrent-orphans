#!/bin/bash

pwsh "C:\\Users\\$USER\\Desktop\\bin\\RT_Pack-main2\\Mover.ps1" -category '' -max_1_size '-1' -max_size '-1' -id_subfolder Y -path_from 'Z:\a\' -path_to 'N:\d\' -client_name client3

pwsh "C:\\Users\\$USER\\Desktop\\bin\\RT_Pack-main\\Mover.ps1" -category '' -max_1_size '-1' -max_size '-1' -id_subfolder Y -path_from 'Z:\a\' -path_to 'N:\d\' -client_name client2

cd "Z:\\"
rmdir */*/* */* * 2>&-
