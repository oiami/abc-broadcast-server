package ABC::Broadcast::Server::Schema;

use utf8;
use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

our $VERSION = '0.01';

__PACKAGE__->load_namespaces;

=head1 AUTHORS

yo

=head1 COPYRIGHT

All rights reserved.

=cut

__PACKAGE__->meta->make_immutable;

1;
