# attend_app

A Flutter web helper for KSU students that transforms a Blackboard course URL into an attendance/grades attendance URL and opens it in a new browser tab.

This is a link helper, not an attendance-submission system. It does not sign you in, mark attendance, or bypass Blackboard permissions.

## Run locally

Use a legacy Flutter SDK with Dart `>=2.12.0 <3.0.0`, as required by [`pubspec.yaml`](pubspec.yaml), and Chrome:

```bash
flutter pub get
flutter run -d chrome
```

The home widget imports `dart:html` directly, so the implemented flow is web-specific despite the repository's mobile scaffolding. Current Dart 3 SDKs do not satisfy its package constraint.

## Usage

1. Sign in to your institution's Blackboard site separately.
2. Copy a course link containing `webapps/` and `course_id`.
3. Paste it into the app and click **get**.
4. The browser opens a URL targeting `attendance/myGradesAttendance` on the same site's URL prefix.

## Source and limitations

- [`lib/Widget/home.dart`](lib/Widget/home.dart) contains the URL transformation and browser-tab action.
- [`lib/homepage.dart`](lib/homepage.dart) provides Home/About tab navigation.
- Input URLs are sliced as strings rather than parsed or validated. Invalid links or a changed Blackboard URL format can produce incorrect URLs or errors.
- The helper depends on the institution's Blackboard attendance endpoint and your existing browser login; compatibility with the current service is unverified.

Only paste trusted course URLs. No Blackboard credentials should be entered into this app.
