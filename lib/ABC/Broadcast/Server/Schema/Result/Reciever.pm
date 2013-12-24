use utf8;
package ABC::Broadcast::Server::Schema::Result::Reciever;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ABC::Broadcast::Server::Schema::Result::Reciever

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<Reciever>

=cut

__PACKAGE__->table("Reciever");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 deviceid

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "deviceid",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<deviceid_unique>

=over 4

=item * L</deviceid>

=back

=cut

__PACKAGE__->add_unique_constraint("deviceid_unique", ["deviceid"]);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-12-24 17:29:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vp9BEqjIwjMBnlHfB3RMIg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
