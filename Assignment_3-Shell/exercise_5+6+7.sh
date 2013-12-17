#!/bin/bash
#set -xv
mkdir public_html test_folder
# Creating test_folder so as to move four files from there instead of Assignment_3-Shell folder to public_html 
# and avoid disturbing files in the main Assignment_3-Shell folder 
touch public_html/readme.txt
touch test_folder/a test_folder/b test_folder/c test_folder/d test_folder/e test_folder/f test_folder/g test_folder/h
chmod 777 public_html
cd test_folder
#move first four(alphabetically) files from test_folder to public_html
for filename in `find . -maxdepth 1 -type f | cut --complement -c1,2 | sort | head -4`
# First four files when sorted alphabetically
do
	mv "$filename" "../public_html/$filename"
	echo "Moved $filename to ../public_html/$filename"
done
cd ..
#Copy the public_html folder inside the public_html
cp -R public_html/ /tmp/
mv /tmp/public_html/ public_html/
#rename it
mv public_html/public_html public_html/renamed-public_html
