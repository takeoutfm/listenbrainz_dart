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

void main() {
  // create client with your authentication token
  final token = 'insert-your-listenbrainz-token-here';
  final client = ListenBrainz(token);

  // submit playing_now
  client.submitPlayingNow(Track(
    title: 'song title',
    artist: 'song artist',
    release: 'song release (optional)',
  ));

  // submit single listen
  final listenedAt = DateTime.now();
  client.submitSingle(
    Track(
      title: 'song title',
      artist: 'song artist',
      release: 'song release (optional)',
    ),
    listenedAt,
  );
}
