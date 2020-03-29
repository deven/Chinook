use utf8;
package Chinook::DB::Result::Employee;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("Employee");
__PACKAGE__->add_columns(
  "EmployeeId",
  {
    accessor          => "employee_id",
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "LastName",
  {
    accessor => "last_name",
    data_type => "nvarchar",
    is_nullable => 0,
    size => 20,
  },
  "FirstName",
  {
    accessor => "first_name",
    data_type => "nvarchar",
    is_nullable => 0,
    size => 20,
  },
  "Title",
  { accessor => "title", data_type => "nvarchar", is_nullable => 1, size => 30 },
  "ReportsTo",
  {
    accessor       => "reports_to",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "BirthDate",
  { accessor => "birth_date", data_type => "datetime", is_nullable => 1 },
  "HireDate",
  { accessor => "hire_date", data_type => "datetime", is_nullable => 1 },
  "Address",
  {
    accessor => "address",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 70,
  },
  "City",
  { accessor => "city", data_type => "nvarchar", is_nullable => 1, size => 40 },
  "State",
  { accessor => "state", data_type => "nvarchar", is_nullable => 1, size => 40 },
  "Country",
  {
    accessor => "country",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 40,
  },
  "PostalCode",
  {
    accessor => "postal_code",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 10,
  },
  "Phone",
  { accessor => "phone", data_type => "nvarchar", is_nullable => 1, size => 24 },
  "Fax",
  { accessor => "fax", data_type => "nvarchar", is_nullable => 1, size => 24 },
  "Email",
  { accessor => "email", data_type => "nvarchar", is_nullable => 1, size => 60 },
);
__PACKAGE__->set_primary_key("EmployeeId");
__PACKAGE__->has_many(
  "customers",
  "Chinook::DB::Result::Customer",
  { "foreign.SupportRepId" => "self.EmployeeId" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "employees",
  "Chinook::DB::Result::Employee",
  { "foreign.ReportsTo" => "self.EmployeeId" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "report_to",
  "Chinook::DB::Result::Employee",
  { EmployeeId => "ReportsTo" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 06:11:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fOadE0OfkRUmtYOEdBst+A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
