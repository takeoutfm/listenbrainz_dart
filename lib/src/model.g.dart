// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Submission _$SubmissionFromJson(Map<String, dynamic> json) => Submission(
      json['listen_type'] as String,
      (json['payload'] as List<dynamic>)
          .map((e) => Payload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmissionToJson(Submission instance) =>
    <String, dynamic>{
      'listen_type': instance.listenType,
      'payload': instance.payloads,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      Track.fromJson(json['track_metadata'] as Map<String, dynamic>),
      json['listened_at'] == null
          ? null
          : DateTime.parse(json['listened_at'] as String),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('listened_at', instance.listenedAt);
  val['track_metadata'] = instance.track;
  return val;
}

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(
      artistMbids: (json['artist_mbids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      releaseGroupMbid: json['release_group_mbids'] as String?,
      releaseMbid: json['release_mbid'] as String?,
      recordingMbid: json['recording_mbid'] as String?,
      trackMbid: json['track_mbid'] as String?,
      workMbids: (json['work_mbids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      trackNumber: json['tracknumber'] as int?,
      isrc: json['isrc'] as String?,
      spotifyId: json['spotify_id'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mediaPlayer: json['media_player'] as String?,
      mediaPlayerVersion: json['media_player_version'] as String?,
      submissionClient: json['submission_client'] as String?,
      submissionClientVersion: json['submission_client_version'] as String?,
      musicService: json['music_service'] as String?,
      musicServiceName: json['music_service_name'] as String?,
      originUrl: json['origin_url'] as String?,
      durationMs: json['duration_ms'] as int?,
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('artist_mbids', instance.artistMbids);
  writeNotNull('release_group_mbids', instance.releaseGroupMbid);
  writeNotNull('release_mbid', instance.releaseMbid);
  writeNotNull('recording_mbid', instance.recordingMbid);
  writeNotNull('track_mbid', instance.trackMbid);
  writeNotNull('work_mbids', instance.workMbids);
  writeNotNull('tracknumber', instance.trackNumber);
  writeNotNull('isrc', instance.isrc);
  writeNotNull('spotify_id', instance.spotifyId);
  writeNotNull('tags', instance.tags);
  writeNotNull('media_player', instance.mediaPlayer);
  writeNotNull('media_player_version', instance.mediaPlayerVersion);
  writeNotNull('submission_client', instance.submissionClient);
  writeNotNull('submission_client_version', instance.submissionClientVersion);
  writeNotNull('music_service', instance.musicService);
  writeNotNull('music_service_name', instance.musicServiceName);
  writeNotNull('origin_url', instance.originUrl);
  writeNotNull('duration_ms', instance.durationMs);
  writeNotNull('duration', instance.duration);
  return val;
}

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      title: json['track_name'] as String,
      artist: json['artist_name'] as String,
      release: json['release_name'] as String?,
      additionalInfo: json['additional_info'] == null
          ? null
          : AdditionalInfo.fromJson(
              json['additional_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackToJson(Track instance) {
  final val = <String, dynamic>{
    'track_name': instance.title,
    'artist_name': instance.artist,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('release_name', instance.release);
  writeNotNull('additional_info', instance.additionalInfo);
  return val;
}

TokenResult _$TokenResultFromJson(Map<String, dynamic> json) => TokenResult(
      json['code'] as int,
      json['message'] as String,
      json['valid'] as bool,
      json['user_name'] as String?,
    );

Map<String, dynamic> _$TokenResultToJson(TokenResult instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'message': instance.message,
    'valid': instance.valid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_name', instance.userId);
  return val;
}

ArtistCredit _$ArtistCreditFromJson(Map<String, dynamic> json) => ArtistCredit(
      name: json['artist_credit_name'] as String,
      mbid: json['artist_mbid'] as String,
      joinPhrase: json['join_phrase'] as String,
    );

Map<String, dynamic> _$ArtistCreditToJson(ArtistCredit instance) =>
    <String, dynamic>{
      'artist_credit_name': instance.name,
      'artist_mbid': instance.mbid,
      'join_phrase': instance.joinPhrase,
    };

MbidMapping _$MbidMappingFromJson(Map<String, dynamic> json) => MbidMapping(
      artistMbids: (json['artist_mbids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => ArtistCredit.fromJson(e as Map<String, dynamic>))
          .toList(),
      caaId: json['caa_id'] as int?,
      caaReleaseMbid: json['caa_release_mbid'] as String?,
      recordingMbid: json['recording_mbid'] as String?,
      recordingName: json['recording_name'] as String?,
      releaseMbid: json['release_mbid'] as String?,
    );

Map<String, dynamic> _$MbidMappingToJson(MbidMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('artist_mbids', instance.artistMbids);
  writeNotNull('artists', instance.artists);
  writeNotNull('caa_id', instance.caaId);
  writeNotNull('caa_release_mbid', instance.caaReleaseMbid);
  writeNotNull('recording_mbid', instance.recordingMbid);
  writeNotNull('recording_name', instance.recordingName);
  writeNotNull('release_mbid', instance.releaseMbid);
  return val;
}

ListenAdditionalInfo _$ListenAdditionalInfoFromJson(
        Map<String, dynamic> json) =>
    ListenAdditionalInfo(
      recordingMsid: json['recording_msid'] as String?,
    );

Map<String, dynamic> _$ListenAdditionalInfoToJson(
    ListenAdditionalInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recording_msid', instance.recordingMsid);
  return val;
}

ListenedTrack _$ListenedTrackFromJson(Map<String, dynamic> json) =>
    ListenedTrack(
      artist: json['artist_name'] as String,
      release: json['release_name'] as String?,
      title: json['track_name'] as String,
      mbidMapping: json['mbid_mapping'] == null
          ? null
          : MbidMapping.fromJson(json['mbid_mapping'] as Map<String, dynamic>),
      additionalInfo: json['additional_info'] == null
          ? null
          : ListenAdditionalInfo.fromJson(
              json['additional_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListenedTrackToJson(ListenedTrack instance) {
  final val = <String, dynamic>{
    'artist_name': instance.artist,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('release_name', instance.release);
  val['track_name'] = instance.title;
  writeNotNull('mbid_mapping', instance.mbidMapping);
  writeNotNull('additional_info', instance.additionalInfo);
  return val;
}

Listen _$ListenFromJson(Map<String, dynamic> json) => Listen(
      listenedAt: json['listened_at'] as int,
      insertedAt: json['inserted_at'] as int,
      recordingMsid: json['recording_msid'] as String?,
      track: ListenedTrack.fromJson(
          json['track_metadata'] as Map<String, dynamic>),
      userId: json['user_name'] as String,
    );

Map<String, dynamic> _$ListenToJson(Listen instance) {
  final val = <String, dynamic>{
    'listened_at': instance.listenedAt,
    'inserted_at': instance.insertedAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recording_msid', instance.recordingMsid);
  val['track_metadata'] = instance.track;
  val['user_name'] = instance.userId;
  return val;
}

ListensPayload _$ListensPayloadFromJson(Map<String, dynamic> json) =>
    ListensPayload(
      count: json['count'] as int,
      latestListenTs: json['latest_listen_ts'] as int?,
      userId: json['user_id'] as String,
      listens: (json['listens'] as List<dynamic>)
          .map((e) => Listen.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListensPayloadToJson(ListensPayload instance) {
  final val = <String, dynamic>{
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latest_listen_ts', instance.latestListenTs);
  val['user_id'] = instance.userId;
  val['listens'] = instance.listens;
  return val;
}

Listens _$ListensFromJson(Map<String, dynamic> json) => Listens(
      ListensPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListensToJson(Listens instance) => <String, dynamic>{
      'payload': instance.payload,
    };
