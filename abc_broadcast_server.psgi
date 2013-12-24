use strict;
use warnings;

use ABC::Broadcast::Server;

my $app = ABC::Broadcast::Server->apply_default_middlewares(ABC::Broadcast::Server->psgi_app);
$app;

