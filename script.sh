#!/bin/bash
MAX_DAYS=360

rm -rf .git
git init

cat  <<EOF > README.md
# This file to generate fake commits
# Please star for this repo ^^ Thank you

EOF

days=$(seq $MAX_DAYS | cat)
for day in $days ;
do 
    r=$(( $RANDOM % 3 )); 
    for i in $(seq $r);
    do
        date="$day days ago"
        message="Fake commited $date"
        echo "- Added fake commit $message with $i commits" >> README.md
        git add .
        git commit --date "$date" -m "$message"
    done
done
git log --oneline | cat

cat <<EOF

# Now push to GitHub
EOF