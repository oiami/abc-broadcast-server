package ABC::Broadcast::Server::View::Web;

use Moose;

extends 'Catalyst::View::TT';


__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
    ENCODING => 'utf8',
);

=head1 NAME

ABC::Broadcast::Server::View::Web - TT View for ABC::Broadcast::Server

=head1 DESCRIPTION

TT View for ABC::Broadcast::Server.

=head1 SEE ALSO

L<ABC::Broadcast::Server>

=head1 AUTHOR

yo

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
