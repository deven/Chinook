use utf8;
package Chinook::DB::Result::InvoiceLine;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("InvoiceLine");
__PACKAGE__->add_columns(
  "invoicelineid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "invoiceid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "trackid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "unitprice",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
  "quantity",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("invoicelineid");
__PACKAGE__->belongs_to(
  "invoiceid",
  "Chinook::DB::Result::Invoice",
  { invoiceid => "invoiceid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "trackid",
  "Chinook::DB::Result::Track",
  { trackid => "trackid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 00:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:b40ljahdFLlTelJ2QZG7Xw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
