#!/bin/bash

PORTS='9090 9191 9292 9393'

DISKS='L M N O P Q R Z'

for p in $PORTS; do
	for i in $(curl -s "http://127.0.0.1:$p/api/v2/sync/maindata?rid=0" -H 'Accept: application/json' | jq '.torrents[] | {infohash_v1}[]' -cr); do
		content_path=$(curl -s "http://127.0.0.1:$p/api/v2/torrents/info?hashes=$i" | jq -r '.[].content_path')
		parent_dir=$(dirname "$content_path" | sed 's/\\/\//g')
		curl -s "http://127.0.0.1:$p/api/v2/torrents/files?hash=$i" | jq -cr '.[].name' | while read rel_path; do
			if [[ X$(basename "$parent_dir") = X$(dirname "$rel_path") ]]; then
				parent_dir=$(dirname "$parent_dir")
			fi
			printf '%s/%s\n' "$parent_dir" "$rel_path"
		done
	done
done 2>&- | tee client_files.txt

for i in $DISKS; do
	find "$i"':/' -type f
done 2>&- | tee present_files.txt

sort client_files.txt > sorted_client_files.txt
sort present_files.txt > sorted_present_files.txt
diff -u sorted_client_files.txt sorted_present_files.txt > diff.txt
