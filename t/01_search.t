use Test::More qw(no_plan);
use WWW::Yahoo::Lyrics::JP;
use utf8;

my $service = WWW::Yahoo::Lyrics::JP->new;
my $song    = $service->search(
    {
        artist => "Perfume",
        title  => "シークレットシークレット"
    }
);

is( ref $song, "WWW::Yahoo::Lyrics::JP::Song", "WWW::Yahoo::Lyrics::JP::Song" );
is( $song->id, "Y063976", "song id" );
is( $song->aid, "325277", "artist id" );
is( $song->link, "http://music.yahoo.co.jp/shop/p/53/325277/Y063976",
    "link url" );
is( $song->swf_url,
    "http://music.yimg.jp/lyrics/lyrics.swf?id=Y063976&aid=325277",
    "swf url" );
diag( "embed tag: \n" . $song->embed_tag );

