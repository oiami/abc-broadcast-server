package ABC::Broadcast::Server::Controller::Root;

use strict;
use warnings;
use utf8;
use parent 'Catalyst::Controller';

# Sets the actions in this controller to be registered with no prefix
#
__PACKAGE__->config(namespace => '');

=head1 NAME

Vipr::Admin::Web::Controller::Root - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller for Vipr::Admin::Web

=head1 METHODS

=cut


=head2 index

Start page for ABC-

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body( "test" );
}

=head2 end

Called at the end of a request, after all URL-matching actions are called.
Forwards to the default Web view, or to the Mobile view if the user is on a mobile device

=cut

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;

}


=head1 AUTHOR

ABC Startsiden

=head1 LICENSE

All rights reserved.

=cut

1;
