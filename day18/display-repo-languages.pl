# cerner_2tothe5th_2021
# Prints languages(recognized by github) used in a repo
#
# How to run?
# brew install perl
# cpan Net::GitHub
# perl display-repo-languages.pl <username> <personal-access-token> <repo>
use Net::GitHub::V3;

$user = $ARGV[0];
$pat = $ARGV[1];
$repoName = $ARGV[2];

$github = Net::GitHub::V3->new(
    access_token => $pat
);

$search = $github->search;
$repos = $github->repos;
$repos->set_default_user_repo($user, $repoName);

%languages = $repos->languages;

printf "User: %s \t Repo: %s\n\nLanguages:\n", $user, $repoName;
for (sort { $languages{$b} <=> $languages{$a} } keys %languages) {
    printf "%s\n", $_;
}
