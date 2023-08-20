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

@JsonSerializable()
class Submission {
  static const typePlayingNow = 'playing_now';
  static const typeSingle = 'single';

  @JsonKey(name: 'listen_type')
  final String listenType;
  @JsonKey(name: 'payload')
  final List<Payload> payloads;

  Submission(this.listenType, this.payloads);

  factory Submission.playingNow(Track track) =>
      Submission(typePlayingNow, [Payload(track)]);

  factory Submission.single(Track track, DateTime listenedAt) =>
      Submission(typeSingle, [Payload(track, listenedAt)]);

  factory Submission.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Payload {
  @JsonKey(name: 'listened_at')
  final int? listenedAt; // unix time
  @JsonKey(name: 'track_metadata')
  final Track track;

  Payload(this.track, [DateTime? listenedAt])
      : listenedAt = listenedAt != null
            ? listenedAt.millisecondsSinceEpoch ~/ 1000
            : null;

  // DateTime get listenedTime =>
  //     DateTime.fromMicrosecondsSinceEpoch(listenedAt * 1000);

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

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

// track_metadata
@JsonSerializable(includeIfNull: false)
class Track {
  @JsonKey(name: 'track_name')
  final String title;
  @JsonKey(name: 'artist_name')
  final String artist;
  @JsonKey(name: 'release_name')
  final String? release;
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

@JsonSerializable(includeIfNull: false)
class ListenAdditionalInfo {
  @JsonKey(name: "recording_msid")
  String? recordingMsid;

  ListenAdditionalInfo({this.recordingMsid});

  factory ListenAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$ListenAdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ListenAdditionalInfoToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ListenedTrack {
  @JsonKey(name: "artist_name")
  String artist;
  @JsonKey(name: "release_name")
  String? release;
  @JsonKey(name: "track_name")
  String title;
  @JsonKey(name: "mbid_mapping")
  MbidMapping? mbidMapping;
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

  DateTime get time => DateTime.fromMillisecondsSinceEpoch(listenedAt * 1000);

  factory Listen.fromJson(Map<String, dynamic> json) => _$ListenFromJson(json);

  Map<String, dynamic> toJson() => _$ListenToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ListensPayload {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "latest_listen_ts")
  final int? latestListenTs;
  @JsonKey(name: "user_id")
  final String userId;
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

@JsonSerializable()
class Listens {
  @JsonKey(name: "payload")
  ListensPayload payload;

  Listens(this.payload);

  factory Listens.fromJson(Map<String, dynamic> json) =>
      _$ListensFromJson(json);

  Map<String, dynamic> toJson() => _$ListensToJson(this);
}
