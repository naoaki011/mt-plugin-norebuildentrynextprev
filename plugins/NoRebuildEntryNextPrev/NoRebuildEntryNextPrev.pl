package MT::Plugin::NoRebuildEntryNextPrev;
use strict;
use MT;
use MT::Plugin;
use base qw( MT::Plugin );
use MT::Entry;

@MT::Plugin::NoRebuildEntryNextPrev::ISA = qw( MT::Plugin );

my $plugin = __PACKAGE__->new( {
    name => 'NoRebuildEntryNextPrev',
    id   => 'NoRebuildEntryNextPrev',
    key  => 'norebuildentrynextprev',
    version => 0.1,
    author_name => 'Alfasado Inc.',
    description => 'Skip rebuild next and previous entry.',
} );

sub init_registry {
    my $plugin = shift;
    $plugin->registry( {
        callbacks => {
            init_app     => \&_init_app,
        },
    } );
}

MT->add_plugin( $plugin );

sub _init_app {
    no warnings 'redefine';
    *MT::Entry::_nextprev = sub { undef; };
};

1;