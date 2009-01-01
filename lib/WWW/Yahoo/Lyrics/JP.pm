package WWW::Yahoo::Lyrics::JP;

use Moose;
use Encode;
use LWP::UserAgent;
use URI::Escape;
use WWW::Yahoo::Lyrics::JP::Song;

our $VERSION = '0.01';

has 'ua' => (
    is      => 'rw',
    isa     => 'LWP::UserAgent',
    default => sub { return LWP::UserAgent->new },
);

has 'end_point' => (
    is      => 'rw',
    isa     => 'Str',
    default => 'http://m.search.music.yahoo.co.jp/bin/lyricssearch?cp=',
);

__PACKAGE__->meta->make_immutable();
no Moose;

sub search {
    my ( $self, $args ) = @_;
    my $song = WWW::Yahoo::Lyrics::JP::Song->new(
        artist => $args->{artist},
        title  => $args->{title}
    );
    my $query      = _escape( $song->artist ) . "+" . _escape( $song->title );
    my $url = $self->end_point . $query;
    my $result_res = $self->ua->get( $url );
    return $song unless $result_res->is_success;
    if($result_res->content =~ m!<div id=\\"acx\\"><a href=\\"(.+?)\\">!){
	$1 =~ m!(\d+)/(Y\d{6})$!;
	$song->aid($1);
	$song->id($2);
    }
    return $song;
}

sub _escape {
    my $str = shift;
    return uri_escape(encode("euc-jp", $str));
}


1;
__END__

=head1 NAME

WWW::Yahoo::Lyrics::JP - Get lyrics from Yahoo Japan

=head1 SYNOPSIS

  use WWW::Yahoo::Lyrics::JP;
  my $service = WWW::Yahoo::Lyrics::JP->new;
  my $song    = $service->search(
      {
          artist => "YUI",
          title  => "CHE.R.RY"
      }
  );
  print $song->swf_url;
  print $song->embed_tag;

=head1 AUTHOR

Yusuke Wada E<lt>yusuke at kamawada.comE<gt>

=head1 SEE ALSO

http://music.yahoo.co.jp/lyrics/

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
