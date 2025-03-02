#!/bin/bash

for disk in L M N O P Q R; do
	path_from="$disk:\\d\\"
	path_to="$disk:\\e\\"
	rt_pack="C:\\Users\\$USER\\Desktop\\bin\\RT_Pack-main"
	rt_pack2="C:\\Users\\$USER\\Desktop\\bin\\RT_Pack-main2"
	mkdir "$path_to"
	pwsh "$rt_pack2\\Mover2.ps1" -category '' -max_1_size '-1' -max_size '-1' -id_subfolder Y -client_name client0 -path_from "$path_from" -path_to "$path_to"
	pwsh "$rt_pack\\Mover2.ps1"  -category '' -max_1_size '-1' -max_size '-1' -id_subfolder Y -client_name client1 -path_from "$path_from" -path_to "$path_to"
	pwsh "$rt_pack\\Mover2.ps1"  -category '' -max_1_size '-1' -max_size '-1' -id_subfolder Y -client_name client2 -path_from "$path_from" -path_to "$path_to"
	pwsh "$rt_pack2\\Mover2.ps1" -category '' -max_1_size '-1' -max_size '-1' -id_subfolder Y -client_name client3 -path_from "$path_from" -path_to "$path_to"
	cd "$path_from"
	rmdir */*/* */* *
done