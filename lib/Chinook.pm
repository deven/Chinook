package Chinook;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use RapidApp;

use Catalyst qw/
    -Debug
    RapidApp::RapidDbic
/;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    name => 'Chinook',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
    encoding => 'UTF-8', # Setup request decoding and response encoding

    'Plugin::RapidApp::RapidDbic' => {
        # Only required option:
        dbic_models => ['DB'],
        configs => { # Model configs
            DB => {
                grid_params => {
                    Album => {
                        include_colspec => ['*', 'artistid.name'],
                    },
                    Track => {
                        include_colspec => ['*', 'albumid.artistid.*'],
                    },
                },
            },
        },
    },
);

# Start the application
__PACKAGE__->setup();

=encoding utf8

=head1 NAME

Chinook - Catalyst based application

=head1 SYNOPSIS

    script/chinook_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Chinook::Controller::Root>, L<Catalyst>

=head1 AUTHOR

,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
