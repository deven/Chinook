use utf8;
package Chinook::DB::Result::Mediatype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("MediaType");
__PACKAGE__->add_columns(
  "MediaTypeId",
  {
    accessor          => "media_type_id",
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "Name",
  { accessor => "name", data_type => "nvarchar", is_nullable => 1, size => 120 },
);
__PACKAGE__->set_primary_key("MediaTypeId");
__PACKAGE__->has_many(
  "tracks",
  "Chinook::DB::Result::Track",
  { "foreign.MediaTypeId" => "self.MediaTypeId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 06:11:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R2bv+QweA/qLp++SQeDpuA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;