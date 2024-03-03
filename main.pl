#!usr/bin/perl

#Set replacement word
sub replace {
    return("big");
}

#Read input file
$file = "input.txt";
open($fh, '<', $file) or die "Could not find $file";
$input = '';
while (my $line = <$fh>) {
    $input .= $line;
}
close($fh);

#Split input into array of words
@split = split(/(\W+)/, $input);

#Replace each word
for my $elem (@split) {
    #If the element is a word (alphabetical characters only), replace it
    if ($elem =~ /[a-zA-Z]/) {
        #Store capitalization
        my $capitalized = ($elem =~ /^[A-Z]/);
        #Replace word
        $elem = replace($elem);
        #Restore capitalization
        $elem = ucfirst($elem) if $capitalized;
    }
}

#Concatenate into str and print
$output = join('', @split);
print "Your embiggened text is: $output";