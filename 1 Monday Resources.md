- [WSL Install Instructions](https://learn.microsoft.com/en-us/windows/wsl/install)
- [Docker install for Ubuntu](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
- [Ryans tutorials](https://ryanstutorials.net/linuxtutorial/)

# Unix Study Guide

## Common Commands
for space seperated names either wrap in single/double quotes or use an escape character with the white space. Also, all files in unix are just files: the extensions are not considered (even directories are files)
### ls (list files/directories)
```cli
ls [options] [location]
```

### cd (change directory)
```cli
cd {location}
```

### pwd (print working directory)
```cli
pwd
```

### man (manual)
"q" will exit the manual
```cli
man {command}
```

### mkdir(make directory)
```cli
mkdir [options] {directory name}
```

### rmdir (remove directory)
this command will fail if there is content in the folder. Add the -r flag if you want to delete the directory and sub files (please don't delete necessary files with this command: -ri is a safer option, because you will be prompted to confirm deleting every file/folder). NOTE: THERE IS NO UNDO OPTION, DELETE FILES AT YOUR PERIL
```cli
rmdir [options] {directory name}
```

### touch (create file)
this command does more than just create files, but it can be used to do so
```cli
touch [options] {file name}
```

### cp (copy)
```cli
cp [option] {source path} {destination path}
```

### mv (move)
note that moving the file to the same location with a new name will just rename the file
```cli
mv [option] {starting file} {new file}
```

### rm (remove)
```cli
rm [options] <file>
```

### cat (concatenate)
```cli
cat <file>
```

### grep (tool for searching for patterns in lines of one or more files)
```grep
grep [option] {pattern} {file/s}
```

### cut
useful if you've made columns in your file: can indicate which field (column) you want shown and the character/s used to seperate the columns. There are other options with this command
```cli
cut -f {column number, seperate multiple via comma} -d [seperator, tab is default] {path/to/file or content}
```

## Redirecting

### > (save to file/overwrite)
the greater-than operator will redirect the output of an operation to a file with a name you provide. If the file already exists the content of the file will be replaced with the new content
```cli
{command/s} > {output file}
```

### >> (redirect to file)
double greater than operators will append the content to a file if it exists instead of saving over the previous content
```cli
{command/s} >> {output file}
```

### | (piping)
"|" is used to chain operations together and send the results from one operation to another
```cli
echo "1 2 3 4 5" | cut -f 1 -d " " # will return 1
```