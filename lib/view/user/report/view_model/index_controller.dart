class IndexController {
  static final IndexController _instance = IndexController._init();
  IndexController._init();
  static IndexController get instance => _instance;

  static int onTapIndex = 0;

  void changeIndex(int index) {
    onTapIndex = index;
  }
}
