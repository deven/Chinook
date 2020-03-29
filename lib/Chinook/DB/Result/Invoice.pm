use utf8;
package Chinook::DB::Result::Invoice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("Invoice");
__PACKAGE__->add_columns(
  "InvoiceId",
  {
    accessor          => "invoice_id",
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "CustomerId",
  {
    accessor       => "customer_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "InvoiceDate",
  { accessor => "invoice_date", data_type => "datetime", is_nullable => 0 },
  "BillingAddress",
  {
    accessor => "billing_address",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 70,
  },
  "BillingCity",
  {
    accessor => "billing_city",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 40,
  },
  "BillingState",
  {
    accessor => "billing_state",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 40,
  },
  "BillingCountry",
  {
    accessor => "billing_country",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 40,
  },
  "BillingPostalCode",
  {
    accessor => "billing_postal_code",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 10,
  },
  "Total",
  {
    accessor => "total",
    data_type => "numeric",
    is_nullable => 0,
    size => [10, 2],
  },
);
__PACKAGE__->set_primary_key("InvoiceId");
__PACKAGE__->belongs_to(
  "customer",
  "Chinook::DB::Result::Customer",
  { CustomerId => "CustomerId" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "invoice_lines",
  "Chinook::DB::Result::Invoiceline",
  { "foreign.InvoiceId" => "self.InvoiceId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 06:11:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5iLEaJDYB6NXYEMzKFxSmA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
