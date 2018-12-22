# EV
export EDITOR=nvim

# Aliases
function myls
    ls --human-readable -ltrah
end

function enc
    gpg -e -r $USER $argv; and rm -rf $argv; or echo "Error, $argv did not encrypt!";
end

function dec
    gpg $argv; and rm -rf $argv; or echo "Error, $argv did not decrypt!";
end
#gpg -e -r $USER $argv; echo "gpg on $file successful" >> logfile; shred $argv and echo
#
#alias gpg = gpg -e -r $USER $1 and {
#    echo "gpg on $file successful" >> logfile
#    shred "$file" and {
#        echo "shred on $file successful" >> logfile
#        } or  {
#        echo "shred on $file successful" >> logfile
#        }
#    } or {
#    echo "Error, $file did not encrypt" >> logfile
#}
#gpg --encrypt <options> "$file" && {
