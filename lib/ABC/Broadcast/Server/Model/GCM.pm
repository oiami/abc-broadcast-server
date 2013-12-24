package ABC::Broadcast::Server::Model::GCM;

=head1 NAME

ABC::Broadcast::Server::Model::GCM - Catalyst Model

=head1 DESCRIPTION

    Interface to google

=head2 USAGE

    Use as Catalyst Model in Catalyst Controller.
=cut

use utf8;
use Moose;
use Data::UUID;
use Moose::Util::TypeConstraints;
use WWW::Google::Cloud::Messaging;
use Readonly;

extends 'Catalyst::Model';

has 'gcm' => (
    is => 'rw',
    isa => 'WWW::Google::Cloud::Messaging',
    builder => '_build_gcm',
    lazy => 1,
);


has 'api_key' => (
    is      => 'rw',
);

sub _build_gcm {
    my ($self) = @_;
    return WWW::Google::Cloud::Messaging->new(api_key => $self->api_key);
}


=head1 METHODS

=head2 programs (<HashRef>)

Performas a search against the Xstream video feed
Returns a Video::Hvordan::Web::View::Helper::Paginator object with results

=cut

sub send_message {
    my ($self, $devices, $message) = @_;
    my $res = $self->gcm->send({
      registration_ids => [ $devices ],
      collapse_key     => $self->_collapse_key,
      data             => {
        message => $message,
      },
   });
   return $res;
}

sub _collapse_key {
    my $self = shift;
    my $ug  = new Data::UUID;
    return  $ug->create_str();
}

1;
