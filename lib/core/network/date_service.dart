class DateService {
  static final DateService _instance = DateService._init();
  DateService._init();
  static DateService get instance => _instance;

  String getDate() {
    var now = DateTime.now();
    String date = "${now.day}/${now.month}/${now.year}";
    return date; // 2016-01-25
  }
}
