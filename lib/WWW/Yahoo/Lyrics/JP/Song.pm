package WWW::Yahoo::Lyrics::JP::Song;

use Moose;
our $VERSION = '0.01';

has artist => (
    is  => 'rw',
    isa => 'Str',
);

has title => (
    is  => 'rw',
    isa => 'Str',
);

has 'aid' => (
    is  => 'rw',
    isa => 'Str',
    deafult => '',
);

has 'id' => (
    is  => 'rw',
    isa => 'Str',
    deafult => '',
);

__PACKAGE__->meta->make_immutable();
no Moose;

sub swf_url {
    my $self = shift;
    return unless $self->id;
    return sprintf("http://music.yimg.jp/lyrics/lyrics.swf?id=%s&aid=%s",
		   $self->id, $self->aid);
}

sub embed_tag {
    my $self = shift;
    return unless $self->id;
    return sprintf(qq{<embed src="http://music.yimg.jp/lyrics/lyrics.swf?id=%s&aid=%s" autostart=0 allowScriptAccess="never"  width="500"  height="400" wmode="transparent"></embed>}, $self->id, $self->aid);
}

sub link {
    my $self = shift;
    return unless $self->id;
    return sprintf("http://music.yahoo.co.jp/shop/p/53/%s/%s", $self->aid, $self->id);
}

1;
__END__

=head1 NAME

WWW::Yahoo::Lyrics::JP::Song -

=head1 SYNOPSIS

  use WWW::Yahoo::Lyrics::JP;

=head1 DESCRIPTION

WWW::Yahoo::Lyrics::JP::Song is

=head1 AUTHOR

Yusuke Wada E<lt>yusuke at kamawada.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
