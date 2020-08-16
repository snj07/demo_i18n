class CommonUtils {
  static T enumFromString<T>(Iterable<T> values, String value) {
    return values.firstWhere((type) => type.toString() == value,
        orElse: () => null);
  }
}
