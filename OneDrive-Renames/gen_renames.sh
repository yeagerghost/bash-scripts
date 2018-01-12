#!/bin/bash

# Script to find illegal characters in a filename.
# These illegal characters are based on OneDrive Standards
# Change the illegal characters on a linux based machine to _ so that onedrive client can function
# illegal characters considered for this script are ==> * : < > ? \ | " and one or more spaces at the end

echo "#!/bin/bash" > rename_files
echo "" >> rename_files
echo "Original and Newnames" > name_changes
echo "=====================" >> name_changes
echo "" >> name_changes
while IFS= read -r line  #http://mywiki.wooledge.org/BashFAQ/001#Trimming
do
  src="$(echo "$line" | sed 's/\"/\\\"/g')"
  dest="$(echo "$line" | sed -E 's/\*|:|<|>|\?|\\|\||\"| +$|^ +|\.$/_/g')"
  #echo $line
  #echo $src
  #echo $dest
  #echo ""
  echo "orignal: $line" >> name_changes
  echo "newname: $dest" >> name_changes
  echo "" >> name_changes

  echo "mv -v \"$src\" \"$dest\"" >> rename_files
done < illegal_name_list


# Note the difference in values of DEST and ODD_DEST
# DEST is assigned using $() method and ODD_DEST is assigned using backticks
# DEST ends up with "/" being replaced by "_" as indicated in the regex
# ODD_DEST does not end up replacing "/"
#
#while read line
#do
#  src=`echo $line | sed 's/\"/\\\"/g'`
#  #echo $line | sed -E 's/\*|:|<|>|\?|\\|\/|\||\"/_/g'
#  dest="$(echo $line | sed -E 's/\*|:|<|>|\?|\\|\/|\||\"/_/g')"
#  odd_dest=`echo $line | sed -E 's/\*|:|<|>|\?|\\|\/|\||\"/_/g'`
#  echo "LINE:      $line"
#  echo "DEST:      $dest"
#  echo "ODD_DEST:  $odd_dest"
#  echo ""
#done < illegal_folders
#
# SAMPLE LINES
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_cancel/<i class="material-icons">cancel<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_check_circle/<i class="material-icons">check_circle<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_clear/<i class="material-icons">clear<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_content_copy/<i class="material-icons">content_copy<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_date_range/<i class="material-icons">date_range<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_delete/<i class="material-icons">delete<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_directions_bike/<i class="material-icons">directions_bike<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_drag_handle/<i class="material-icons">drag_handle<:i>
#./zold/frodo/frodo-ressrcs/frodo-icons/ic_favorite/<i class="material-icons">favorite<:i>
