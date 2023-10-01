class PngAssets {
  static String get logo => 'logo'.png;

  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
}
