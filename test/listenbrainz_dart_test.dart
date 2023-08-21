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
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('test playing_now', () async {
      final track = Track(
        title: 'Cars',
        artist: 'Gary Numan',
        release: 'The Pleasure Principle',
      );
      final submission = Submission.playingNow(track);
      expect(submission.listenType, 'playing_now');
      expect(submission.payloads.length, 1);
      expect(submission.payloads[0].track.title, 'Cars');
      expect(submission.payloads[0].track.artist, 'Gary Numan');
      expect(submission.payloads[0].track.release, 'The Pleasure Principle');
      expect(submission.payloads[0].listenedAt, null);
    });

    test('test single', () async {
      final track = Track(
        title: 'Cars',
        artist: 'Gary Numan',
        release: 'The Pleasure Principle',
      );
      final then = DateTime.now();
      final submission = Submission.single(track, then);
      expect(submission.listenType, 'single');
      expect(submission.payloads.length, 1);
      expect(submission.payloads[0].track.title, 'Cars');
      expect(submission.payloads[0].track.artist, 'Gary Numan');
      expect(submission.payloads[0].track.release, 'The Pleasure Principle');
      expect(submission.payloads[0].listenedAt, then.millisecondsSinceEpoch ~/ 1000);
    });

    test('listens', () async {
      final client = ListenBrainz('not used');
      final userId = 'defsub';
      final result = await client.listens(userId);
      expect(result.isNotEmpty, true);
      for (var l in result) {
        expect(l.userId, userId);
        expect(l.track.artist.isNotEmpty, true);
        expect(l.track.title.isNotEmpty, true);
      }
    });
  });
}
