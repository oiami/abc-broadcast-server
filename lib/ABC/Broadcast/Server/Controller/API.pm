package ABC::Broadcast::Server::Controller::API;
use Moose;
use namespace::autoclean;
use WWW::Google::Cloud::Messaging;

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
    my $msg = $c->req->params->{message};
    my $ug    = new Data::UUID;
    my $uuid1 = $ug->create_str();
    my $gcm = WWW::Google::Cloud::Messaging->new(api_key => 'AIzaSyBwZzqQMacT2xSEKeAHxKgTEPsO12t5cVw');
    my @reciever_list = $c->model('DB::Reciever')->get_column('deviceid')->all;
    
    my $res = $c->model('GCM')->send_message( \@reciever_list, $msg);
    if( $res->is_success ){
        my $msg_res = $c->model('DB::Message')->create({'detail' => $msg});
        $self->status_ok($c, entity => { success => "message is sent" });
    } else {
        $self->status_bad_request( $c,
                message => 'Cannot send data' . $res->error );
    }
}

sub message_GET {
    my ( $self, $c ) = @_;
    my $msg = $c->req->params->{message};
    my $ug    = new Data::UUID;
    my $uuid1 = $ug->create_str();
    my $gcm = WWW::Google::Cloud::Messaging->new(api_key => 'AIzaSyBwZzqQMacT2xSEKeAHxKgTEPsO12t5cVw');
    my @reciever_list = $c->model('DB::Reciever')->get_column('deviceid')->all;
    
    my $res = $c->model('GCM')->send_message( \@reciever_list, $msg);
    if( $res->is_success ){
        my $msg_res = $c->model('DB::Message')->create({'detail' => $msg});
        $self->status_ok($c, entity => { success => "message is sent" });
    } else {
        $self->status_bad_request( $c,
                message => 'Cannot send data' . $res->error );
    }
}

=head2 device

regist device with

=cut

sub device : Local ActionClass('REST') {}

sub device_PUT {
    my ( $self, $c ) = @_;
    my $device_id = $c->req->params->{device_id};
    my $res = $c->model('DB::Reciever')->update_or_create({'deviceid' => $device_id});
    if( $res ){
        $self->status_ok($c, entity => { success=> 'true', message => $device_id . ' is created'});
    } else {
        $self->status_bad_request( $c,
                message => 'Cannot create data' );
    }
}

sub device_GET {
    my ( $self, $c ) = @_;
    my $device_id = $c->req->params->{device_id};

    my $res = $c->model('DB::Reciever')->update_or_create({'deviceid' => $device_id});
    if( $res ){
        $self->status_ok($c, entity => { success=> 'true', message => $device_id . ' is created'});
    } else {
        $self->status_bad_request( $c,
                message => 'Cannot create data' );
    }
}

1;
