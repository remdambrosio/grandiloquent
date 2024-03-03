#!usr/bin/perl
use strict;
use warnings;

# SUBROUTINE: Embiggen text
sub bigger {
    my @text = @_;
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
    my @text = @_;
    for my $elem (@text) {
        # If the element is a word (alphabetical characters only), replace it
        if ($elem =~ /[a-zA-Z]/) {
            # Store capitalization
            my $capitalized = ($elem =~ /^[A-Z]/);
            # Replace word
            $elem = "bet";
            # Restore capitalization
            $elem = ucfirst($elem) if $capitalized;
        }
    }
    return @text;
} # End better


# BEGIN MAIN PROGRAM

# Open input file
my $file = "input.txt";
open(my $fh, '<', $file) or die "Could not find $file $!";
my $input = '';

# Read line-by-line
while (my $line = <$fh>) {
    $input .= $line;
}
close($fh);

# Split input into array of words
my @input_words = split(/(\W+)/, $input);

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
        @text = bigger(@input_words);
    } elsif ($mode eq "better") {
        @text = better(@input_words);
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