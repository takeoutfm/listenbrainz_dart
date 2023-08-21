// Copyright 2023 defsub
//
// This file is part of listenbrainz_dart.
//
// listenbrainz_dart is free software: you can redistribute it and/or modify it
// under the terms of the GNU Affero General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// listenbrainz_dart is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
// for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with listenbrainz_dart. If not, see <https://www.gnu.org/licenses/>.

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

/// Submission to ListenBrainz with one or more listens.
@JsonSerializable()
class Submission {
  static const typePlayingNow = 'playing_now';
  static const typeSingle = 'single';

  /// Type of listen. Should be `playing_now` or `single`.
  @JsonKey(name: 'listen_type')
  final String listenType;

  /// Submission payload entries.
  @JsonKey(name: 'payload')
  final List<Payload> payloads;

  Submission(this.listenType, this.payloads);

  /// Creates a playing_now submission.
  factory Submission.playingNow(Track track) =>
      Submission(typePlayingNow, [Payload(track)]);

  /// Creates a single track submission with timestamp.
  factory Submission.single(Track track, DateTime listenedAt) =>
      Submission(typeSingle, [Payload(track, listenedAt)]);

  factory Submission.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}

/// Payload for ListenBrainz submission.
@JsonSerializable(includeIfNull: false)
class Payload {
  /// Listen timestamp stored in Unix epoch time. playing_now does not have
  /// a timestamp.
  @JsonKey(name: 'listened_at')
  final int? listenedAt; // unix time

  /// Listen track metadata.
  @JsonKey(name: 'track_metadata')
  final Track track;

  Payload(this.track, [DateTime? listenedAt])
      : listenedAt = listenedAt != null
            ? listenedAt.millisecondsSinceEpoch ~/ 1000
            : null;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

/// Optional additional information that may be included with a submission.
/// See ListenBrainz API documentation for further information.
@JsonSerializable(includeIfNull: false)
class AdditionalInfo {
  @JsonKey(name: "artist_mbids")
  final List<String>? artistMbids;
  @JsonKey(name: "release_group_mbids")
  final String? releaseGroupMbid;
  @JsonKey(name: "release_mbid")
  final String? releaseMbid;
  @JsonKey(name: "recording_mbid")
  final String? recordingMbid;
  @JsonKey(name: "track_mbid")
  final String? trackMbid;
  @JsonKey(name: "work_mbids")
  final List<String>? workMbids;
  @JsonKey(name: "tracknumber")
  final int? trackNumber;
  @JsonKey(name: "isrc")
  final String? isrc;
  @JsonKey(name: "spotify_id")
  final String? spotifyId;
  @JsonKey(name: "tags")
  final List<String>? tags;
  @JsonKey(name: "media_player")
  final String? mediaPlayer;
  @JsonKey(name: "media_player_version")
  final String? mediaPlayerVersion;
  @JsonKey(name: "submission_client")
  final String? submissionClient;
  @JsonKey(name: "submission_client_version")
  final String? submissionClientVersion;
  @JsonKey(name: "music_service")
  final String? musicService;
  @JsonKey(name: "music_service_name")
  final String? musicServiceName;
  @JsonKey(name: "origin_url")
  final String? originUrl;
  @JsonKey(name: "duration_ms")
  final int? durationMs;
  @JsonKey(name: "duration")
  final int? duration;

  AdditionalInfo({
    this.artistMbids,
    this.releaseGroupMbid,
    this.releaseMbid,
    this.recordingMbid,
    this.trackMbid,
    this.workMbids,
    this.trackNumber,
    this.isrc,
    this.spotifyId,
    this.tags,
    this.mediaPlayer,
    this.mediaPlayerVersion,
    this.submissionClient,
    this.submissionClientVersion,
    this.musicService,
    this.musicServiceName,
    this.originUrl,
    this.durationMs,
    this.duration,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}

/// Track metadata.
@JsonSerializable(includeIfNull: false)
class Track {
  /// Track name/title.
  @JsonKey(name: 'track_name')
  final String title;

  /// Track artist name.
  @JsonKey(name: 'artist_name')
  final String artist;

  /// Optional track release name/title.
  @JsonKey(name: 'release_name')
  final String? release;

  /// Optional track additional information.
  @JsonKey(name: "additional_info")
  final AdditionalInfo? additionalInfo;

  Track({
    required this.title,
    required this.artist,
    this.release,
    this.additionalInfo,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}

/// Token valdation result.
@JsonSerializable(includeIfNull: false)
class TokenResult {
  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'valid')
  final bool valid;
  @JsonKey(name: 'user_name')
  final String? userId;

  TokenResult(this.code, this.message, this.valid, [this.userId]);

  factory TokenResult.fromJson(Map<String, dynamic> json) =>
      _$TokenResultFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResultToJson(this);
}

/// Artist credit.
@JsonSerializable(includeIfNull: false)
class ArtistCredit {
  @JsonKey(name: "artist_credit_name")
  final String name;
  @JsonKey(name: "artist_mbid")
  final String mbid;
  @JsonKey(name: "join_phrase")
  final String joinPhrase;

  ArtistCredit({
    required this.name,
    required this.mbid,
    required this.joinPhrase,
  });

  factory ArtistCredit.fromJson(Map<String, dynamic> json) =>
      _$ArtistCreditFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistCreditToJson(this);
}

/// MusicBrainz mapping associated with a returned listen.
@JsonSerializable(includeIfNull: false)
class MbidMapping {
  @JsonKey(name: "artist_mbids")
  List<String>? artistMbids;

  @JsonKey(name: "artists")
  List<ArtistCredit>? artists;

  @JsonKey(name: "caa_id")
  int? caaId;

  @JsonKey(name: "caa_release_mbid")
  String? caaReleaseMbid;

  @JsonKey(name: "recording_mbid")
  String? recordingMbid;

  @JsonKey(name: "recording_name")
  String? recordingName;

  @JsonKey(name: "release_mbid")
  String? releaseMbid;

  MbidMapping({
    this.artistMbids,
    this.artists,
    this.caaId,
    this.caaReleaseMbid,
    this.recordingMbid,
    this.recordingName,
    this.releaseMbid,
  });

  factory MbidMapping.fromJson(Map<String, dynamic> json) =>
      _$MbidMappingFromJson(json);

  Map<String, dynamic> toJson() => _$MbidMappingToJson(this);
}

/// Additional listen information.
@JsonSerializable(includeIfNull: false)
class ListenAdditionalInfo {
  @JsonKey(name: "recording_msid")
  String? recordingMsid;

  ListenAdditionalInfo({this.recordingMsid});

  factory ListenAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$ListenAdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ListenAdditionalInfoToJson(this);
}

/// Listened track from user listens.
@JsonSerializable(includeIfNull: false)
class ListenedTrack {
  /// Track artist name.
  @JsonKey(name: "artist_name")
  String artist;

  /// Optional track release name/title.
  @JsonKey(name: "release_name")
  String? release;

  /// Track name/title.
  @JsonKey(name: "track_name")
  String title;

  /// Optional MusicBrainz mapping.
  @JsonKey(name: "mbid_mapping")
  MbidMapping? mbidMapping;

  /// Optional additional information.
  @JsonKey(name: "additional_info")
  ListenAdditionalInfo? additionalInfo;

  ListenedTrack({
    required this.artist,
    this.release,
    required this.title,
    this.mbidMapping,
    this.additionalInfo,
  });

  factory ListenedTrack.fromJson(Map<String, dynamic> json) =>
      _$ListenedTrackFromJson(json);

  Map<String, dynamic> toJson() => _$ListenedTrackToJson(this);
}

/// A recorded listen.
@JsonSerializable(includeIfNull: false)
class Listen {
  @JsonKey(name: "listened_at")
  final int listenedAt;
  @JsonKey(name: "inserted_at")
  final int insertedAt;
  @JsonKey(name: "recording_msid")
  final String? recordingMsid;
  @JsonKey(name: "track_metadata")
  final ListenedTrack track;
  @JsonKey(name: "user_name")
  final String userId;

  Listen({
    required this.listenedAt,
    required this.insertedAt,
    this.recordingMsid,
    required this.track,
    required this.userId,
  });

  /// Gets the listen time as a [DateTime].
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(listenedAt * 1000);

  factory Listen.fromJson(Map<String, dynamic> json) => _$ListenFromJson(json);

  Map<String, dynamic> toJson() => _$ListenToJson(this);
}

/// Payload for users listens.
@JsonSerializable(includeIfNull: false)
class ListensPayload {
  /// The number of listens.
  @JsonKey(name: "count")
  final int count;

  /// Latest listen timestamp.
  @JsonKey(name: "latest_listen_ts")
  final int? latestListenTs;

  /// ListenBrainz user.
  @JsonKey(name: "user_id")
  final String userId;

  /// User listens.
  @JsonKey(name: "listens")
  final List<Listen> listens;

  ListensPayload({
    required this.count,
    this.latestListenTs,
    required this.userId,
    required this.listens,
  });

  factory ListensPayload.fromJson(Map<String, dynamic> json) =>
      _$ListensPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ListensPayloadToJson(this);
}

/// ListenBrainz listens response with payload.
@JsonSerializable()
class Listens {
  @JsonKey(name: "payload")
  ListensPayload payload;

  Listens(this.payload);

  factory Listens.fromJson(Map<String, dynamic> json) =>
      _$ListensFromJson(json);

  Map<String, dynamic> toJson() => _$ListensToJson(this);
}
