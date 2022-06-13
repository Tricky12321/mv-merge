# Move and merge
The functionality that `mv` is missing!

This small bash script adds merge functionality to mv, however in a serperate command, `mv-merge`.

I was tired of having two folders with similar structure and `mv` simply saying 
`mv: cannot move '<source>' to '<destination>': Directory not empty`

Rsync took ages to do this task, and cp was stupid because it in the event the files were large, it would double the disk usage for duration of the move which is not always an option, and it was slow.
### Usage:
```
mv-merge <source> <destination>
```
Moves all files with folder structure form source to destination.



## Install:
Simply execute the following command (Requires sudo):
```
git clone https://github.com/Tricky12321/mv-merge.git;sudo cp mv-merge/mv-merge /usr/bin/; rm -Rf mv-merge
```
Done. 

## Uninstall
Simply execute the following command (Requires sudo):
```
sudo rm /usr/bin/mv-merge
```
Done.