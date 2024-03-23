class AssetsManager {
  static AssetIcons icons = AssetIcons();
  static AssetImages images = AssetImages();
}

class AssetIcons {
  final String _path = 'assets/icons/';
  AssetSvgs svg = AssetSvgs();

  String get shape1 => '${_path}shape1.png';
}

class AssetImages {
  final String _path = 'assets/images/';

  String get quran => '${_path}quran.png';
  String get lastRead => '${_path}last_read.png';
  String get surahCard => '${_path}surah_card.png';
  String get besmellah => '${_path}besmellah.png';
}

class AssetSvgs {
  final String _path = 'assets/icons/svg_icons/';

  String get readme => '${_path}readme.svg';
  String get menu => '${_path}menu.svg';
  String get bookmark => '${_path}bookmark.svg';
  String get play => '${_path}play.svg';
  String get share => '${_path}share.svg';
}
