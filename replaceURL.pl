#!/usr/bin/perl

use strict;
use warnings;
use File::Find;

# ---------------------------------------------------------------
# Arguments given at command line call
#
# -u => the the replacement URL
# -o => the URL which must be replaced
# -d => the directory where the files are stored
# -b => if added it will remove backup files made by this program
# ----------------------------------------------------------------

our $^I = '.bak';
my $replacementURL = ""; 
my $originalURL = "";
my $directory = "";
my $counter = 0;
my $affected = 0;
my $backups = 1;

foreach (@ARGV) {
  $counter++;
  if ($_ eq "-d") {
    $directory = $ARGV[$counter];
  }

  if ($_ eq "-u") {
    $replacementURL = $ARGV[$counter];
  }

  if ($_ eq "-o") {
    $originalURL = $ARGV[$counter];
  }
  
  if ($_ eq "-b") {
    $backups = 0;
  }
}

find(\&wanted, $directory);

sub wanted {
  if (/\.html$/) {
    $affected++;
    local @ARGV = ($_);
    
    my $backup_file = "$_.bak";

    while (<>) {
      s/$originalURL/$replacementURL/ig;
      print;
    }
    
    if ($backups == 0) {
      unlink($backup_file);
    }
  }
}

print "directory: $directory\n";
print "replacementURL: $replacementURL\n";
print "originalURL: $originalURL\n";
print "affected html files: $affected\n";
