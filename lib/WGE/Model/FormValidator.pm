package WGE::Model::FormValidator;
## no critic(RequireUseStrict,RequireUseWarnings)
{
    $WGE::Model::FormValidator::VERSION = '0.009';
}
## use critic


use warnings FATAL => 'all';

use Moose;
use WGE::Exception::Validation;
use namespace::autoclean;

extends 'WebAppCommon::FormValidator';

has '+model' => (
    isa => 'WGE::Model::DB',
);

=head2 throw

Override parent throw method to use WGE::Exception::Validation.

=cut
override throw => sub {
    my ( $self, $params, $results ) = @_;

    WGE::Exception::Validation->throw(
        params => $params,
        results => $results,
    );
};

1;
