import 'package:collection/collection.dart';

enum ApplicationPage {
  aboutUs,
  contactUs,
  home,
}

enum HomePageShowcaseWidget {
  galaxy,
  formBuilder,
}

enum ApplicationPageHover {
  aboutUs,
  contactUs,
  home,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ApplicationPage):
      return ApplicationPage.values.deserialize(value) as T?;
    case (HomePageShowcaseWidget):
      return HomePageShowcaseWidget.values.deserialize(value) as T?;
    case (ApplicationPageHover):
      return ApplicationPageHover.values.deserialize(value) as T?;
    default:
      return null;
  }
}
