class AppLink {
  static const String kSplashPath = '/splash';
  static const String kHomePath = '/home';

  static const String kTabParam = 'tab';

  String? location;

  int? currentTab;

  AppLink({
    this.location,
    this.currentTab,
  });

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');

    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');

    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
    );

    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '$key=$value&';

    switch (location) {
      case kHomePath:
        var loc = '$kHomePath?';
        loc += addKeyValPair(
          key: kTabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
      default:
        return kSplashPath;
    }
  }
}
