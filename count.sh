#!/bin/bash

# Example:
#   ./count.sh "ketancmaheshwari"
# returns
#   56, 1030, 787
# 
# of files, insertions, deletions, respectively
#
# Cf. 
#   git shortlog -s -n
# only returns number of files
  
for i in "Katz" "ketancmaheshwari" "Terrya" "Lapp" "Loeffler" "Turk" "jameshowison" "Hanwell" "Frank" "wilkins" "Wilkins" "Hetherington" "Allen" "shelswenson"
do
	git log --author="$i" --shortstat $BRANCH | \
	awk '/^ [0-9]/ { f += $1; i += $4; d += $6 } \
	END { printf("%d, %d, %d\n", f, i, d) }'
done

