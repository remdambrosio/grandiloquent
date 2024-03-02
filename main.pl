#!usr/bin/perl

#Set replacement word
sub replace {
    return("big");
}

#Take input and remove newline
print "Intercalate a subgrandiloquent pronouncement: ";
$input=<STDIN>;
chomp $input;

#Split input into array of words
@split = split(/(\W+)/, $input);

#Replace each word with the word "big"
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
print "Your embiggened sentence is: $output";