use Test::More qw(no_plan);
use WWW::Yahoo::Lyrics::JP;
use utf8;

my $service = WWW::Yahoo::Lyrics::JP->new;
my $song    = $service->search(
    {
     artist => "Mr.Children",
     title  => "NOT FOUND"
    }
);

ok(1);
diag( $song->id );
diag( $song->aid );
diag( $song->link );
diag( $song->swf_url );
diag( $song->embed_tag );
