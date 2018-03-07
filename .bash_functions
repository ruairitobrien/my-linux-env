# create .tar.gz (can never remember that command) e.g. > targz mydir
targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }
# extra .tar.gz e.g. > untargs mydir
untargz() { tar -zxvf $1; rm -r $1; }
# count files in dir e.g. > numfiles ~/Desktop
numfiles() { 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}
# make dir and go to it
mkcd() { mkdir -p $1; cd $1 }