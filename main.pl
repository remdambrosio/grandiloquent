#!usr/bin/perl

# SUBROUTINE: Embiggen text
sub bigger {
    my @bigger = @_;
    for my $elem (@bigger) {
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
    return @bigger;
} # End bigger

# SUBROUTINE: Embetter text
sub better {
    my @better = @_;
    for my $elem (@better) {
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
    return @better;
} # End better


# Open input file
$file = "input.txt";
open($fh, '<', $file) or die "Could not find $file $!";
$input = '';

# Read line-by-line
while (my $line = <$fh>) {
    $input .= $line;
}
close($fh);

# Split input into array of words
@input_words = split(/(\W+)/, $input);

# Main loop
while () {

    # Choose mode
    my $mode = "unselected";
    while ($mode ne "bigger" && $mode ne "better") {
        print "Would you like to make your input.txt BIGGER or BETTER?\n";
        $mode = lc(<STDIN>);
        chomp($mode);
    }

    # Copy input for manipulation
    my @text = @input_words;

    # Replace each word
    if ($mode eq "bigger") {
        @text = bigger(@text);
    } elsif ($mode eq "better") {
        @text = better(@text);
    }

    # Concatenate into str and print
    my $output = join('', @text);
    print "Your altered text is:\n====================\n$output\n====================\n";

    # Repeat or quit
    print "Would you like to try again? Y/N:\n";
    my $quit_choice = lc(<STDIN>);
    chomp($quit_choice);
    if ($quit_choice eq "n") {last};

} # End main loop