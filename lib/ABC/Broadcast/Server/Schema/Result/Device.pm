package  ABC::Broadcast::Server::Schema::Result::Device;

=head1 NAME

ABC::Broadcast::Server::Schema::Result::Device

=cut

use utf8;
use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components('InflateColumn::DateTime', 'TimeStamp');

=head1 TABLE: C<video>

=cut

__PACKAGE__->table('device');

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  
=head2 device_id

  data_type: 'integer'
  is_nullable: 0
  
=head2 created

  data_type: 'timestamp'
  is_nullable: 1

=head2 enable

  data_type: 'integer'
  is_nullable: 1
  default_value => 1

=cut

__PACKAGE__->add_columns(
    'id',
    { data_type => 'integer', is_auto_increment => 1, is_nullable => 0 },
    'device_id',
    { data_type => 'integer', is_nullable => 0 },
    'enable',
    { data_type => 'integer', is_nullable => 1, default_value => 0},
    'created',
    { data_type => 'datetime', timezone => 'UTC', is_nullable => 1,set_on_create => 1, },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key('id');

__PACKAGE__->meta->make_immutable;

1;
