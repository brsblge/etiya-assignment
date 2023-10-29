extension StringExt on String? {
  bool isNullOrEmpty() => this == null || this!.trim().isEmpty;
}
