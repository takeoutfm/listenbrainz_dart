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

import 'package:listenbrainz_dart/listenbrainz_dart.dart';
import 'package:listenbrainz_dart/src/client.dart';
import 'package:test/test.dart';

void main() {
  final token = 'token';

  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('foo', () async {
      final client = ListenBrainz(token);
      final result = await client.submitPlayingNow(Track(
        title: 'Cars',
        artist: 'Gary Numan',
        release: 'The Pleasure Principal',
      ));
      print(result.statusCode);
      print(result.reasonPhrase);
      print(result.body);
    });

    test('foo1', () async {
      final client = ListenBrainz(token);
      final result = await client.validate();
      print(result.valid);
      print(result.code);
      print(result.message);
      print(result.userId);
    });

    test('listens', () async {
      final client = ListenBrainz(token);
      final result = await client.listens('defsub');
      for (var l in result) {
        print('${l.time} ${l.userId}: ${l.track.artist} / ${l.track.release} / ${l.track.title}');
      }
    });
  });
}
