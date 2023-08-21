ListenBrainz client library for Dart.

## Features

- Submit now playing
- Submit listens
- Fetch listens

## Getting started

listenbrainz_dart requires a valid authorization token from ListedBrainz.

## Usage

```dart
final client = ListenBrainz('insert-token-here');
client.submitSingle(Track(title: 'Cars', artist: 'Gary Numan'), DateTime.now());
```

```dart
const like = 'sample';
```

## Additional information

See github.com/takeoutfm.

