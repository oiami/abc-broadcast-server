package ABC::Broadcast::Server::Controller::API;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    stash_key => 'data',
    default   => 'application/json',
    map => {
        'text/html' => [ 'View', 'JSON' ],
    },
);

=head2 message

sent message to gcm server

=cut

sub message : Local ActionClass('REST') {}

sub message_PUT {
    my ( $self, $c ) = @_;
    $self->status_ok($c, entity => { success=> 'true'});
}

sub message_GET {
    my ( $self, $c ) = @_;
    $self->status_ok($c, entity => { success=> 'true'});
}

=head2 device

regist device with

=cut

sub device : Local ActionClass('REST') {}

sub device_PUT {
    my ( $self, $c ) = @_;
    my $device_id = $c->req->params->{device_id};
    $self->status_ok($c, entity => { success=> 'true', device_id => $device_id});
}

sub device_GET {
    my ( $self, $c ) = @_;
    my $device_id = $c->req->params->{device_id};
    $self->status_ok($c, entity => { success=> 'true', device_id => $device_id});
}

1;
