use utf8;
package Chinook::DB::Result::Track;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("Track");
__PACKAGE__->add_columns(
  "TrackId",
  {
    accessor          => "track_id",
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "Name",
  { accessor => "name", data_type => "nvarchar", is_nullable => 0, size => 200 },
  "AlbumId",
  {
    accessor       => "album_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "MediaTypeId",
  {
    accessor       => "media_type_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "GenreId",
  {
    accessor       => "genre_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "Composer",
  {
    accessor => "composer",
    data_type => "nvarchar",
    is_nullable => 1,
    size => 220,
  },
  "Milliseconds",
  { accessor => "milliseconds", data_type => "integer", is_nullable => 0 },
  "Bytes",
  { accessor => "bytes", data_type => "integer", is_nullable => 1 },
  "UnitPrice",
  {
    accessor => "unit_price",
    data_type => "numeric",
    is_nullable => 0,
    size => [10, 2],
  },
);
__PACKAGE__->set_primary_key("TrackId");
__PACKAGE__->belongs_to(
  "album",
  "Chinook::DB::Result::Album",
  { AlbumId => "AlbumId" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);
__PACKAGE__->belongs_to(
  "genre",
  "Chinook::DB::Result::Genre",
  { GenreId => "GenreId" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);
__PACKAGE__->has_many(
  "invoice_lines",
  "Chinook::DB::Result::Invoiceline",
  { "foreign.TrackId" => "self.TrackId" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "media_type",
  "Chinook::DB::Result::Mediatype",
  { MediaTypeId => "MediaTypeId" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "playlist_tracks",
  "Chinook::DB::Result::Playlisttrack",
  { "foreign.TrackId" => "self.TrackId" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->many_to_many("playlists", "playlist_tracks", "playlist");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 06:11:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:U40aOMRBaXoNH/hcc5M+Qg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
