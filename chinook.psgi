use strict;
use warnings;

use Chinook;

my $app = Chinook->apply_default_middlewares(Chinook->psgi_app);
$app;

