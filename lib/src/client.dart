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

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'model.dart';

class _ClientWithHeaders extends http.BaseClient {
  final http.Client _client;
  final Map<String, String> _headers;

  _ClientWithHeaders(this._client, this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    for (var e in _headers.entries) {
      request.headers[e.key] = e.value;
    }
    return _client.send(request);
  }
}

class ListenBrainz {
  static const maxItemsPerGet = 100;
  static const defaultItemsPerGet = 25;

  final String _token;
  final String endpoint;
  final String? userAgent;

  ListenBrainz(String token, {String? endpoint, this.userAgent})
      : _token = token,
        endpoint = endpoint ?? 'https://api.listenbrainz.org';

  http.Client _client() {
    final ua = userAgent;
    final client = _ClientWithHeaders(http.Client(), {
      if (ua != null) HttpHeaders.userAgentHeader: ua,
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Token $_token',
    });
    return client;
  }

  Future<http.Response> _submit(Map<String, dynamic> json) async {
    assert(json.isNotEmpty);
    assert(_token.isNotEmpty);
    final url = Uri.parse('$endpoint/1/submit-listens');
    return _client().post(url, body: jsonEncode(json));
  }

  Future<TokenResult> _validate() async {
    assert(_token.isNotEmpty);
    final url = Uri.parse('$endpoint/1/validate-token');
    final resp = await _client().get(url);
    final json =
        jsonDecode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>;
    return TokenResult.fromJson(json);
  }

  Future<Listens> _listens(String userId,
      {int? min, int? max, int? count}) async {
    assert(userId.isNotEmpty);
    List<String> params = [];
    if (min != null) {
      params.add("min_ts=$min");
    }
    if (max != null) {
      params.add("max_ts=$max");
    }
    if (count != null) {
      if (count < 0) {
        count = defaultItemsPerGet;
      } else if (count > maxItemsPerGet) {
        count = maxItemsPerGet;
      }
      params.add("count=$count");
    }
    String queryString = '';
    if (params.isNotEmpty) {
      queryString = '?${params.join('&')}';
    }
    final url = Uri.parse('$endpoint/1/user/$userId/listens$queryString');
    print(url);
    final resp = await _client().get(url);
    final json =
        jsonDecode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>;
    return Listens.fromJson(json);
  }

  Future<http.Response> submitPlayingNow(Track track) async =>
      submit(Submission.playingNow(track));

  Future<http.Response> submitSingle(Track track, DateTime listenedAt) async =>
      submit(Submission.single(track, listenedAt));

  Future<http.Response> submit(Submission submission) async =>
      _submit(submission.toJson());

  Future<TokenResult> validate() async => _validate();

  Future<List<Listen>> listens(String userId,
      {int? min, int? max, int? count}) async {
    final listens = await _listens(userId, min: min, max: max, count: count);
    return listens.payload.listens;
  }
}
