# Flutter Template

This project contains everything that you will need in order to immediately start developing your highly scaled application. You can also call this folder structure as <b> Feature-first (layers inside features) </b> design.

<b><h2> About the folder structure </h2></b>

```
    lib/
    ├── config/
    |   ├── assets/
    |   ├── bloc/
    |   ├── dependency_injection/
    |   ├── i10n/
    |   ├── router/
    |   ├── theme/
    |   ├── config.dart
    ├── core/
    │   ├── constants/
    │   │   └── colors.dart
    │   ├── exceptions/
    │   │   └── routing_exception.dart
    |   │── network/
    │   │    └── network.dart
    |   └── utils/
    │       └── utils.dart
    ├── features/
    │   ├── album/
    │   |   ├── application
    │   |   ├── data
    │   |   ├── domain
    │   |   ├── presentation
    │   |   ├── album.dart
    │   ├── shared/
    │   |   ├── data
    │   |   ├── infrastructure
    │   |   ├── models
    │   |   ├── presentation
    │   |   ├── shared.dart
    │   |___features.dart
    └── main.dart
```


## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows
the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localized string, open the `app_en.arb` file at `lib/config/l10n/arb/app_en.arb`.

```arb
{
  "@@locale": "en",
  "appName": "LastFM",
  "@appName": {
    "description": "The application name"
  }
}
```

2. Then add a new key/value and description

```arb
{
  "@@locale": "en",
  "appName": "LastFM",
  "@appName": {
    "description": "The application name"
  },
  "albums": "Albums",
  "@albums": {
    "description": "Text shown in the AppBar of AlbumsScreen"
  },
}
```

3. Use the new string

```dart
import 'package:some_app/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.albums);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

<key>CFBundleLocalizations</key>
<array>
<string>en</string>
<string>am</string>
</array>

        ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/config/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_am.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
  "@@locale": "en",
  "appName": "LastFM",
  "@appName": {
    "description": "The application name"
  },
}
```

`app_am.arb`

```arb
{
  "@@locale": "am",
  "appName": "የመጨረሻ ኤፍ ኤም",
  "@appName": {
    "description": "የመተግበሪያ ስም"
  },
}
```