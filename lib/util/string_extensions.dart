extension TitleCase on String {
  String toTitleCase() {
    return this
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
