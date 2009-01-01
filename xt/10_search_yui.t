use Test::More qw(no_plan);
use WWW::Yahoo::Lyrics::JP;
use utf8;

my $service = WWW::Yahoo::Lyrics::JP->new;
my $song    = $service->search(
    {
     artist => "YUI",
     title  => "CHE.R.RY"
    }
);

diag("search CHE.R.RY by YUI");

is( ref $song, "WWW::Yahoo::Lyrics::JP::Song", "WWW::Yahoo::Lyrics::JP::Song" );
is( $song->id, "Y040339", "song id" );
is( $song->aid, "358664", "artist id" );
is( $song->link, "http://music.yahoo.co.jp/shop/p/53/358664/Y040339",
    "link url" );
is( $song->swf_url,
    "http://music.yimg.jp/lyrics/lyrics.swf?id=Y040339&aid=358664",
    "swf url" );
diag( "embed tag: \n" . $song->embed_tag );
