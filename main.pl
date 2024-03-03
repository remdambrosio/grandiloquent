#!usr/bin/perl
use strict;
use warnings;

# SUBROUTINE: Embiggen text
sub bigger {
    # Array passed by reference, working copy made
    my ($text_ref) = @_;
    my @text = @$text_ref;
    for my $elem (@text) {
        # If the element is a word (alphabetical characters only), replace it
        if ($elem =~ /[a-zA-Z]/) {
            # Store capitalization
            my $capitalized = ($elem =~ /^[A-Z]/);
            # Replace word
            $elem = "big";
            # Restore capitalization
            $elem = ucfirst($elem) if $capitalized;
        }
    }
    return @text;
} # End bigger

# SUBROUTINE: Embetter text
sub better {
    # Arrays passed by reference, working copy made for text but not wordlist
    my ($text_ref, $wl_ref) = @_;
    my @text = @$text_ref;
    for my $elem (@text) {
        # If the element is a word (alphabetical characters only), replace it
        if ($elem =~ /[a-zA-Z]/) {
            # Store capitalization
            my $capitalized = ($elem =~ /^[A-Z]/);
            # Replace word with random entry from wordlist
            $elem = $wl_ref->[rand @$wl_ref];
            # Restore capitalization
            $elem = ucfirst($elem) if $capitalized;
        }
    }
    return @text;
} # End better


# BEGIN MAIN PROGRAM

# Open input file
my $input_filename = "input.txt";
open(my $input_file, "<", $input_filename) or die "Could not find $input_filename $!";
my $input = "";
# Read line-by-line
while (my $line = <$input_file>) {
    $input .= $line;
}
close($input_file);

# Split input into array of words
my @input_words = split(/(\W+)/, $input);

# Open wordlist file into an array
my $wl_filename = "wordlist.txt";
open(my $wl_file, "<", $wl_filename) or die "Could not find $wl_filename $!";
my @wl = <$wl_file>;
chomp(@wl);
close($wl_file);

# Main loop
while () {

    # Choose mode
    my $mode = "unselected";
    while ($mode ne "bigger" && $mode ne "better") {
        print "Would you like to make your input.txt BIGGER or BETTER?\n";
        $mode = lc(<STDIN>);
        chomp($mode);
    }

    # Replace words as appropriate
    my @text;
    if ($mode eq "bigger") {
        @text = bigger(\@input_words);
    } elsif ($mode eq "better") {
        @text = better(\@input_words, \@wl);
    }

    # Concatenate into str and print
    my $output_print = join('', @text);
    print "==========INPUT===========\n$input\n";
    print "==========OUTPUT==========\n$output_print\n==========================\n";

    # Repeat or quit
    print "Would you like to try again? Y/N:\n";
    my $quit_choice = lc(<STDIN>);
    chomp($quit_choice);
    if ($quit_choice eq "n") {
        last;
    }

} # End main loop