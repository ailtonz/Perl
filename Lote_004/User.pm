package MyApp::Form::User;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

has '+item_class' => ( default => 'User' );

has_field 'name' => ( type => 'Text' );
has_field 'age' => ( type => 'PosInteger', apply => [ 'MinimumAge' ] );
has_field 'birthdate' => ( type => 'DateTime' );
has_field 'birthdate.month' => ( type => 'Month' ); # Explicitly split
has_field 'birthdate.day' => ( type => 'MonthDay' ); # fields for renderer
has_field 'birthdate.year' => ( type => 'Year' );
has_field 'hobbies' => ( type => 'Multiple' );
has_field 'address' => ( type => 'Text' );
has_field 'city' => ( type => 'Text' );
has_field 'state' => ( type => 'Select' );
has_field 'email' => ( type => 'Email' );

has '+dependency' => ( default => sub {
    [ ['address', 'city', 'state'], ]
 }
);

subtype 'MinimumAge'
 => as 'Int'
 => where { $_ > 13 }
 => message { "You are not old enough to register" };

no HTML::FormHandler::Moose;
1;