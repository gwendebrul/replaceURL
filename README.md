# Short Perl script for replacing an URL with another one

So this script takes 3 to 4 parameters on the command line and replaces all specified URLs to another one in all html files in a directory (and sub-directories).

## usage

There are 3 required parameters and 1 optional

- parameter -u "<replacementURL>" => replacement URL
- parameter -o "<originalURL>" => original URL
- paremeter -d "<directory>" => root directory for starting replacing URLs

The optional parameter is for removing the backup files created by the script.
On default the backup files are retained, if you want them removed you have to add this parameter.

- parameter -b => this removes all backup files after finisihing the replacements.

## example

    ./replaceURL -u "http://endor-five.local" -o "https://www.msx.org" -d "test" -b

