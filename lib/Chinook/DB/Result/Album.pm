use utf8;
package Chinook::DB::Result::Album;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("Album");
__PACKAGE__->add_columns(
  "AlbumId",
  {
    accessor          => "album_id",
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "Title",
  { accessor => "title", data_type => "nvarchar", is_nullable => 0, size => 160 },
  "ArtistId",
  {
    accessor       => "artist_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("AlbumId");
__PACKAGE__->belongs_to(
  "artist",
  "Chinook::DB::Result::Artist",
  { ArtistId => "ArtistId" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "tracks",
  "Chinook::DB::Result::Track",
  { "foreign.AlbumId" => "self.AlbumId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 06:11:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oU4mC/FstOQM6CkkAKrHdg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
