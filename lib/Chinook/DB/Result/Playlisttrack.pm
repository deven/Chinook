use utf8;
package Chinook::DB::Result::Playlisttrack;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("PlaylistTrack");
__PACKAGE__->add_columns(
  "PlaylistId",
  {
    accessor       => "playlist_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "TrackId",
  {
    accessor       => "track_id",
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("PlaylistId", "TrackId");
__PACKAGE__->belongs_to(
  "playlist",
  "Chinook::DB::Result::Playlist",
  { PlaylistId => "PlaylistId" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "track",
  "Chinook::DB::Result::Track",
  { TrackId => "TrackId" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-29 06:11:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3/8XDTSenwDqhWTY10JRyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
